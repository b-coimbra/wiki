
const handler = {
  get: (target, name) =>
    `<${name}>${target[name]}</${name}>`
};

let html   = new Proxy({}, handler);
    html.p = "h-hewwo";

console.log(html.p); // <p>h-hewwo</p>
