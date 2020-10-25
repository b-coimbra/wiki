#include <iostream>
#include <vector>
#include <cstdlib>
#include <cassert>
#include <cmath>

struct Connection
{
    double weight;
    double deltaWeight;
};

class Neuron;

typedef std::vector<Neuron> Layer;

class Neuron
{
public:
    Neuron(unsigned numOutputs, unsigned myIndex);
    void setOutputVal(double val) { m_outputVal = val; }
    double getOutputVal(void) const { return m_outputVal; }
    void feedForward(const Layer &prevLayer);
    void calcOutputGradients(double targetVal);
    void calcHiddenGradients(const Layer &nextLayer);
    void updateInputWeights(Layer &prevLayer);
private:
    static double eta; //   [0.0..1.0] overall net training rate
    static double alpha; // [0.0..n] multiplier of last weight change (momentum)
    static double transferFunction(double x);
    static double transferFunctionDerivative(double x);
    static double randomWeight(void) { return rand() / double(RAND_MAX); }
    double sumDOW(const Layer &nextLayer) const;
    double m_outputVal;
    std::vector<Connection> m_outputWeights;
    unsigned m_myIndex;
    double m_gradient;
};

double Neuron::eta = 0.15; // overall net learning rate
double Neuron::alpha = 0.5; // momentum, multiplier of last deltaWeight, [0.0..n]

void Neuron::updateInputWeights(Layer &prevLayer)
{
    // the weights to be updated are in the Connection container in the neurons in the preceding layer

    for (unsigned n = 0; n < prevLayer.size(); ++n) {
        Neuron &neuron = prevLayer[n];
        double oldDeltaWeight = neuron.m_outputWeights[m_myIndex].deltaWeight;

        double newDeltaWeight = 
            // individual input, magnified by the gradient and train rate:
            eta
            * neuron getOutputVal()
            * m_gradient
            // also add momentum = a fraction of the previous delta weight
            + alpha
            * oldDeltaWeight;

        neuron.m_outputWeights[m_myIndex].deltaWeight = newDeltaWeight;
        neuron.m_outputWeights[m_myIndex].weight += newDeltaWeight;
    }
}

double Neuron::sumDOW(const Layer &nextLayer) const
{
    double sum = 0.0;

    // sum our contributions of the errors of the nodes we feed

    for (unsigned n = 0; n < nextLayer.size() - 1; ++n) {
        sum += m_outputWeights[n].weight * nextLayer[n].m_gradient;
    }

    return sum;
}

void Neuron::calcHiddenGradients(const Layer &nextLayer)
{
    double dow = sumDOW(nextLayer);
    m_gradient = dow * Neuron::transferFunctionDerivative(m_outputVal);
}

void Neuron::calcOutputGradients(double targetVal)
{
    double delta = targetVal - m_outputVal;
    m_gradient = delta * Neuron::transferFunctionDerivative(m_outputVal);
}

double Neuron::transferFunction(double x)
{
    // tanh - output range [-1.0..1.0]
    return tanh(x);
}

double Neuron::transferFunctionDerivative(double x)
{
    // tanh derivative 
    return 1.0 - x * x;
}

void Neuron::feedForward(const Layer &prevLayer)
{
    double sum = 0.0;

    // sum the previous layer's outputs (which are our inputs)
    // include the bias mode from the previous layer

    for (unsigned n = 0; n < prevLayer.size(); ++n) {
        sum += prevLayer[n].getOutputVal() *
            prevLayer[n].m_outputWeights[m_myIndex].weight;
    }

    m_outputVal = Neuron::transferFunction(sum);
}

Neuron::Neuron(unsigned numOutputs)
{
    for (unsigned c = 0; c < numOutputs; ++c) {
        m_outputWeights.push_back(Connection());
        m_outputWeights.back().weight = randomWeight();
    }

    m_myIndex = myIndex;
}

class Net
{
public:
    Net(const std::vector<unsigned> &topology);
    void feedForward(const std::vector<double> &inputVals);
    void backProp(const std::vector<double> &targetVals);
    void getResults(std::vector<double> &resultVals) const;
private:
    std::vector<Layer> m_layers; // m_layers[layerNum][neuronNum]
    double m_error;
    double m_recentAverageError;
    double m_recentAverageSmoothingFactor;
};

void Net::getResults(std::vector<double> &resultVals) const
{
    resultVals.clear();

    for (unsigned n = 0; n < m_layers.back().size() - 1; ++n) {
        resultVals.push_back(m_layers.back()[n].getOutputVal());
    }
}

void Net::backProp(const std::vector<double> &targetVals)
{
    // calculate overall net error (RMS of output errors)

    Layer &outputLayer = m_layers.back();
    m_error = 0.0;

    for (unsigned n = 0; n < outputLayer.size() - 1; ++n) {
        double delta = targetVals[n] - outputLayer[n].getOutputVal();
        m_error += delta * delta;
    }

    m_error /= outputLayer.size() - 1;
    m_error = sqrt(m_error); // RMS;

    // Implement a recent average measurement

    m_recentAverageError = 
        (m_recentAverageError * m_recentAverageSmoothingFactor + m_error)
        / (m_recentAverageSmoothingFactor + 1.0);

    // calculate output layer gradients

    for (unsigned n = 0; n < outputLayer.size() - 1; ++n) {
        outputLayer[n].calcOutputGradients(targetVals[n]);
    }

    // calculate gradients on hidden layers

    for (unsigned layerNum = m_layers.size() - 2; layerNum > 0; --layerNum) {
        Layer &hiddenLayer = m_layers[layerNum];
        Layer &nextLayer = m_layers[layerNum + 1];

        for (unsigned n = 0; n < hiddenLayer.size(); ++n) {
            hiddenLayer[n].calcHiddenGradients(nextLayer);
        }
    }

    // for all the layers from outputs to fist hidden layer
    // update connection weights

    for (unsigned layerNum = m_layers.size() - 1; layerNum > 0; --layerNum) {
        Layer &layer = m_layers[layerNum];
        Layer &prevLayer = m_layers[layerNum - 1];

        for (unsigned n = 0; n < layer.size() - 1; ++n) {
            layer[n].updateInputWeights(prevLayer);
        }
    }
}

void Net::feedForward(const std::vector<double> &inputVals)
{
    assert(inputVals.size() == m_layers[0].size() - 1);

    // take values from inputVals and put into the input neurons
    for (unsigned i = 0; i < inputVals.size(); ++i) {
        m_layers[0][i].setOutputVal(inputVals[i]);
    }

    // forward propagate
    for (unsigned layerNum = 1; layerNum < m_layers.size(); ++layerNum) {
        Layer &prevLayer = m_layers[layerNum - 1];
        for (unsigned n = 0; n < m_layers[layerNum].size() - 1; ++n) {
            m_layers[layerNum][n].feedForward(prevLayer);
        }
    }
}

Net::Net(const std::vector<unsigned> &topology)
{
    unsigned numLayers = topology.size();
    for (unsigned layerNum = 0; layerNum < numLayers; ++layerNum) {
        m_layers.push_back(Layer()); // append new layer to container
        unsigned numOutputs = layerNum == topology.size() - 1 ? 0 : topology[layerNum + 1];

        // filling the layer with neurons
        for (unsigned neuronNum = 0; neuronNum <= topology[layerNum]; ++neuronNum) {
            m_layers.back().push_back(Neuron(numOutputs, neuronNum));
            std::cout << "Made a neuron!" << std::endl;
        }

        // force the bias node's output value to 1.0. It's the last neuron created above
        m_layers.back().back().setOutputVal(1.0);
    }
}

int main(int argc, char *argv[])
{
    std::vector<unsigned> topology;
    topology.push_back(3);
    topology.push_back(2);
    topology.push_back(1);
    Net neural_net(topology);

    std::vector<double> inputVals;
    neural_net.feedForward(inputVals); // feeding data

    std::vector<double> targetVals;
    neural_net.backProp(targetVals); // training: what the output should be

    std::vector<double> resultVals;
    neural_net.getResults(resultVals); // fetching the results

    return 0;
}
