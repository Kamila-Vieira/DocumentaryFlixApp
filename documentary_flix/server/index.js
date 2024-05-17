import { config } from "dotenv";
import jsonServer from "json-server";

config();
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();

const port = process.env.PORT || 8080;
const host = process.env.HOST || "localhost";

server.use(middlewares);
server.use(router);

server.listen(port, host, () => {
  const baseUrl = `http://${host}:${port}`;
  console.log(`
  JSON Server is running in ${baseUrl}
  Access categories from ${baseUrl}/categories
  Access videos from ${baseUrl}/videos
  Access Banner highlight from ${baseUrl}/banner_highlight
  `);
});
