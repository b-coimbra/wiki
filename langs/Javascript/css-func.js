export const plain = (...args) => String.raw({raw: args[0]}, ...args.slice(1));

export const style = string => {
  const node = document.createElement('style');
  node.innerHTML = string;
  document.body.appendChild(node);
};

export const css = (s, ...exps) => style(plain(s, ...exps));

/* ------- somewhere else ------- */

css`* { background: #000 }`;
