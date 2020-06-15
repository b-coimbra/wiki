const fs = require('fs');
const { execSync } = require('child_process');
var parser = null;

const filename = process.argv[2];
const outputFile = filename.split('.')[0] + '.txt';
const filters = [
  "MD5"
];

const install_pkg = async () => {
  try {
    parser = require('xml2json');
  } catch (error) {
    execSync("npm install xml2json", (err, stdout, stderr) => console.log(stdout));
    parser = require('xml2json');
  }
};

const output = (line) =>
      fs.appendFileSync(`./${outputFile}`, line + "\n", (err) => err && console.warn(err));

install_pkg().then(() => {
  fs.readFile(filename, (err, data) => {
    const json = JSON.parse(parser.toJson(data)).flashing.steps.step;

    for (let step of json) {
      if (filters.length)
        filters.forEach(f => delete step[f]);

      output(Object.values(step).join(' '));
    }
  });

  console.log("DONE");
});
