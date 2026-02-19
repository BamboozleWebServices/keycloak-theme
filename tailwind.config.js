/** @type {import('tailwindcss').Config} */
const colors = require("tailwindcss/colors");

module.exports = {
  content: ["./theme/**/*.{ftl,html,js}"],
  theme: {
    extend: {
      colors: {
        primary: {
          50:  "#f0f5ff",
          100: "#dce8ff",
          200: "#b9d0ff",
          300: "#85aeff",
          400: "#4d83ff",
          500: "#1a5cff",
          600: "#0046e0",
          700: "#0038b8",
          800: "#002e94",
          900: "#002070",
          950: "#00134a",
        },
        secondary: {
          500: "#00c4b4",
          600: "#00a898",
        },
      },
    },
  },
  plugins: [],
};
