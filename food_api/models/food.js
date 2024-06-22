const mongoose = require("mongoose");

const foodSchema = new mongoose.Schema({
  name: String,
  price: String,
  imagepath: String,
  rating: String,
  description: String,
});

module.exports = mongoose.model("Food", foodSchema);
