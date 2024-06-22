const express = require("express");
const router = express.Router();
const Food = require("../models/food");

// Get all foods
router.get("/", async (req, res) => {
  try {
    const foods = await Food.find();
    res.json(foods);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Create a food
router.post("/", async (req, res) => {
  const food = new Food({
    name: req.body.name,
    price: req.body.price,
    imagepath: req.body.imagepath,
    rating: req.body.rating,
    description: req.body.description,
  });

  try {
    const newFood = await food.save();
    res.status(201).json(newFood);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

module.exports = router;
