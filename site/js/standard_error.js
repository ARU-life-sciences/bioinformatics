import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let height = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
      return {
        height: +d["5_Height_in_cm"]
      };
  }
);

const mean = d3.mean(height, d => d.height);
const se = d3.deviation(height, d => d.height) / Math.sqrt(height.length);
const data= [{ Mean: mean, y: "Height (cm)", se1: mean + se, se2: mean - se}];

// using observable plot, create a single
// mean with a standard error bar using Plot.link

const plot = Plot.plot({
  y: {axis:null},
  marginLeft: 70,
  x: {domain: [160, 175], label: "Height (cm)"},
  caption: "The red dot is the mean height of the students with ± 1 standard error as a white horizontal bar.",
  marks: [
    Plot.link(data, {x1: "se1", x2: "se2", y1: "y", y2: "y" }),
    Plot.dot(data, {x: "Mean", y: "y", fill: "red", r: 5})
  ]
});

const div = document.querySelector("#standard_error_plot");
div.append(plot);
