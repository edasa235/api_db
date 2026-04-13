import { readdir, writeFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// go from db/script → db/migrations
const MIGRATIONS_DIR = path.resolve(__dirname, "../migrations");
const OUTPUT_FILE = path.join(MIGRATIONS_DIR, "run_all_migrations.sql");

async function generateRunFile() {
    const files = (await readdir(MIGRATIONS_DIR))
        .filter(f => f.endsWith(".sql"))
        .filter(f => f !== "run_all_migrations.sql") // avoid self include
        .sort();

    if (files.length === 0) {
        console.log("No migration files found.");
        return;
    }

    const content = files
        .map(f => `\\i ${f}`)
        .join("\n");

    await writeFile(OUTPUT_FILE, content, "utf8");

    console.log("Generated:", OUTPUT_FILE);
}

generateRunFile().catch(err => {
    console.error("Error:", err);
});