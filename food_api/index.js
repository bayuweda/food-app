const express = require("express");
const cors = require("cors"); // Import cors package

const app = express();
const PORT = 3000;

// Gunakan cors sebagai middleware global
app.use(cors());

// Definisikan endpoint untuk API foodMenu
app.get("/api/foodMenu", (req, res) => {
  // Logika untuk mengambil data foodMenu
  // Contoh data
  const foodMenu = [
    {
      name: "salmon",
      price: "Rp.10000",
      imagepath: "lib/images/salmon.png",
      rating: "4,9",
      description: "Lorem ipsum dolor sit amet...",
    },
    {
      name: "nigiri",
      price: "Rp.120000",
      imagepath: "lib/images/nigiri.png",
      rating: "5",
      description: "Lorem ipsum dolor sit amet...",
    },
    {
      name: "sushi",
      price: "Rp.1230000",
      imagepath: "lib/images/sushi.png",
      rating: "5",
      description: "Lorem ipsum dolor sit amet...",
    },
  ];

  // Mengirimkan response dengan data foodMenu
  res.json(foodMenu);
});

// Mulai server di port yang telah ditentukan
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
