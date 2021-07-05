
let user = {
  name: "Jonh",
  age: 22,
  _password: "*******"
};

String.prototype.isPrivate = function () {
  return this.startsWith('_');
};

user = new Proxy(user, {
  ownKeys(target) {
	return Object.keys(target).filter(key => !key.isPrivate());
  },
  get(target, prop) {
	if (prop.isPrivate())
	  throw new Error('Access denied.');
	else
	  return target[prop];
  },
  set(target, prop, value) {
	if (prop.isPrivate())
	  throw new Error('Access denied.');
	else
	  target[prop] = value;
  }
});

for (let key in user)
  console.log(key, user[key]);

user.name = "Bruno";

console.log(user._password);

user._password = 'password123';

const wrap = (target) => new Proxy(target, {
  get(target, prop) {
	if (prop in target)
	  return target[prop];
	else
	  throw new Error(`Property not found: ${prop}`);
  }
});

const negativeArray = (target) => new Proxy(target, {
  get: (target, prop, receiver) =>
	Reflect.get(target, (prop < 0) ? (target.length + +prop) : prop, receiver)
});

let nums = negativeArray([3, 8, 9]);

nums[-1];

const hide = (target, prefix = '_') => new Proxy(target, {
  has: (target, prop)      => (!prop.startsWith(prefix) && prop in target),
  ownKeys: (target)        => Reflect.ownKeys(target).filter(key => !key.startsWith(prefix)),
  get: (target, prop, rec) => (prop in rec) ? target[prop] : undefined
});

let user = hide({
  name: 'John',
  age: 34,
  _password: '******',
  _token: '#####'
});

console.log(user.name, user.age);
console.log(Object.getOwnPropertyNames(user));
console.log(user._password);
console.log(user._token);
