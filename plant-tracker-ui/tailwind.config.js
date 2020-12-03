const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  theme: {
    extend: {
      height: {
        "72": "18rem",
        "84": "21rem",
        "96": "24rem",
      },
      width: {
        "72": "18rem",
        "84": "21rem",
        "96": "24rem",
      },
    },
    colors: {
      gray: colors.coolGray,
      blueGray: colors.blueGray,
    }
  },
  variants: {},
  plugins: [],
};
