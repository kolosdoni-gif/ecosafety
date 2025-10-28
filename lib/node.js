import express from "express";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const app = express();
const PORT = 3000;

const __filename = fileURLToPath(import.meta.url);
const _dirname = path.dirname(_filename);

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

const dataFile = path.join(__dirname, "data", "posts.json");

// Postları oxuma
app.get("/api/posts", (req, res) => {
  const posts = JSON.parse(fs.readFileSync(dataFile, "utf8"));
  res.json(posts);
});

// Yeni post əlavə et
app.post("/api/posts", (req, res) => {
  const posts = JSON.parse(fs.readFileSync(dataFile, "utf8"));
  const newPost = {
    id: Date.now(),
    title: req.body.title,
    content: req.body.content,
  };
  posts.push(newPost);
  fs.writeFileSync(dataFile, JSON.stringify(posts, null, 2));
  res.json({ message: "Post əlavə olundu ✅" });
});

app.listen(PORT, () =>
  console.log(`✅ Server işləyir: http://localhost:${PORT}`

  )
);


    
