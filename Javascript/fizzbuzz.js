for (
  var i = ((i)=> { return {i: i, f: i % 3 == 0, b: i % 5 == 0 } })(1);
  ((i)=> { console.log(`${ (i.f && 'fizz') || '' }${ (i.b && 'buzz') || '' }` || i.i); return i.i < 101 })(i);
  i = ((i)=> { return { i: i, f: i % 3 == 0, b: i % 5 == 0 } })(++i.i)
){}