const express = require("express");
const app = express();
const port = 3000;

// Middleware
app.use(express.json());

// Routes
app.use("/api/food", require("./food_app_api/routes/food"));

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
