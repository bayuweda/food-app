const admin = require("firebase-admin");

const serviceAccount = require("./lib/firebase/sushiapp-2d2f4-firebase-adminsdk-abrpj-05fbabb5e7.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestore = admin.firestore();

// Contoh data makanan
const foods = [
  {
    name: "Sushi",
    price: "Rp. 100000",
    imagePath: "lib/images/sushi.png",
    rating: "4.9",
    description: "Delicious Japanese sushi",
  },
  {
    name: "Nigiri",
    price: "Rp. 120000",
    imagePath: "lib/images/nigiri.png",
    rating: "5",
    description: "High-quality Japanese nigiri",
  },
  // Tambahkan data makanan lainnya sesuai kebutuhan
];

async function addFoods() {
  const batch = firestore.batch();

  foods.forEach((food) => {
    const foodRef = firestore.collection("foods").doc();
    batch.set(foodRef, food);
  });

  await batch.commit();
  console.log("Data makanan berhasil ditambahkan ke Firestore.");
}

addFoods().catch((error) => {
  console.error("Error adding foods: ", error);
});
