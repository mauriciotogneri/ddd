const admin = require("firebase-admin")
const { setGlobalOptions } = require("firebase-functions/v2")
const { onRequest } = require("firebase-functions/v2/https")

admin.initializeApp()

setGlobalOptions({
  memory: "1GiB",
  timeoutSeconds: 530,
})

exports.healthcheck = onRequest(async (_, response) => {
  response.send("Healthy")
})