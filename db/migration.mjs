import crypto from "node:crypto";
import { readdir, readFile, writeFile, mkdir } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const DIR = path.resolve(__dirname, "migrations");

const OUT_DIR = path.resolve(__dirname, "migrations");
const MANIFEST = path.join(OUT_DIR, "migrations.manifest.json");

const hash = (buf) =>
    crypto.createHash("sha256").update(buf).digest("hex");

export async function listMigrations() {
    return (await readdir(DIR))
        .filter((f) => f.endsWith(".sql"))
        .sort();
}

export async function buildManifest() {
    const files = await listMigrations();

    const manifest = {};
    for (const f of files) {
        const content = await readFile(path.join(DIR, f));
        manifest[f] = hash(content);
    }

    return manifest;
}

export async function writeManifest() {
    const manifest = await buildManifest();

    await mkdir(OUT_DIR, { recursive: true });

    await writeFile(
        MANIFEST,
        JSON.stringify(manifest, null, 2),
        "utf8"
    );

    console.log("manifest written ->", MANIFEST);
}

export async function verifyManifest() {
    const actual = await buildManifest();

    const expected = JSON.parse(
        await readFile(MANIFEST, "utf8")
    );

    for (const k of Object.keys(expected)) {
        if (!actual[k] || actual[k] !== expected[k]) {
            throw new Error(`Mismatch: ${k}`);
        }
    }

    console.log("migrations OK");
}
const cmd = process.argv[2];

if (cmd === "write") {
    await writeManifest();
}

if (cmd === "verify") {
    await verifyManifest();
}