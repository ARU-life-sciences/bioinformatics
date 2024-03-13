import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let raw_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Weight: +d["6_Weight_in_kg"],
      Height: +d["5_Height_in_cm"],
      Gender: d["3_Gender"]
    };
  }
);

const plot = Plot.plot({
  marginLeft: 80,
  marginBottom: 40,
  grid: true,
  color: { legend: true },
  x: {
    inset: 6,
    label: "Height (cm)",
  },
  y: {
    label: "Weight (kg)"
  },
  caption: "Scatterplot with line of best fit, showing a potential relationship between weight (kg) and height (cm), between the two genders.",
  marks: [
    Plot.dot(raw_data, { x: "Height", y: "Weight", stroke: "Gender" }),
    Plot.linearRegressionY(raw_data, { x: "Height", y: "Weight", stroke: "Gender" }),
    Plot.axisX({ fontSize: 15 }),
    Plot.axisY({ fontSize: 15 })
  ]
});

const div = document.querySelector("#correlation_regression_plot");
div.append(plot);


