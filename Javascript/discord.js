
ID = '';
token = 'NTIzOTUzNTYyNjkxMzA1NDcy.DvhDXQ.t8V4xNoqFiEGIIypAtL6UPyj8gQ';

data = { "content": "kek" };
data = JSON.stringify(data);

fetch(`https://discordapp.com/api/channels/${ID}/messages` {
  method: 'POST',
  body: data,
  headers: new Headers({
    "Authorization": `Bot ${token}`,
    "User-Agent": "DPE (https://discord.com, v0.1)",
    "Content-Type": "application/json",
  })
})
  .then((res) => res.json())
  .then(data) => alert(JSON.stringify(data));
