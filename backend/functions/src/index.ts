import {setGlobalOptions} from "firebase-functions/v2";
import {onRequest, Request} from "firebase-functions/v2/https";
import * as express from "express";

setGlobalOptions({
  //memory: "1GiB",
  timeoutSeconds: 530,
})

export const healthcheck = onRequest((_: Request, response: express.Response) => {
  response.send("Super healthy!");
});
