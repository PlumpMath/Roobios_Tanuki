
### Helsinki-Lounge

#### quickstart development process


##### Prerequisites

- node and Npm
- `npm i -g webpack`, `npm i -g nodemon`
- A Redis server installed and running locally (let me know if this a problem I could remove this whole structure if needed.)


##### Pack and watch web-app
- `cd react-browser-client/helsinki-lounge_src`
- `webpack -w`

##### To start server:
- `cd servers`
- `nodemon -w . -w ../concordance/ server_213.coffee` to start the dev-server
- load browser to localhost:port listed in terminal  `localhost:6494`
