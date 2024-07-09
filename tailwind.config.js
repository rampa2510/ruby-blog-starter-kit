module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        "kode-mono": ["Kode Mono", "monospace"],
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
  darkMode: "class",
};
