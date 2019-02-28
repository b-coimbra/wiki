

// destructuring
function feed(animal) {
  return `Feed ${animal.name} ${animal.meal} ${animal.diet}`;
}

function feed({ name, meal, diet }) {
  return `Feed ${name} ${meal} ${diet}`;
}

function feed(animal) {
  const { name, meal, diet } = animal;

  return `Feed ${name} ${meal} ${diet}`;
}
