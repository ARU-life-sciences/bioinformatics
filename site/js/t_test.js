import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let raw_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Gender: d["3_Gender"],
      Height: +d["5_Height_in_cm"]
    };
  }
);

const plot = Plot.plot({
  style: {
    display: "block",
    margin: "auto",
  },
  marginLeft: 80,
  marginBottom: 40,
  width: 250,
  x: {
    inset: 6,
  },
  y: {
    grid: true,
    label: "Height (cm)",
  },
  caption: "Horizontal box plots showing the potential difference between male and female students in height.",
  marks: [
    Plot.boxY(raw_data, { x: "Gender", y: "Height" }),
    Plot.axisX({ fontSize: 15 }),
    Plot.axisY({ fontSize: 15 })
  ]
});

const div = document.querySelector("#t_test_plot");
div.append(plot);


