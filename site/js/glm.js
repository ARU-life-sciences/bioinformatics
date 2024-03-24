import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let raw_data_1 = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Height: +d["5_Height_in_cm"],
      Heart: +d["19_Heart_rate_bpm_me"],
    };
  }
);

// remove NA's
const raw_data = raw_data_1.filter(function(d) {
  return d.Heart > 0;
});


let fitted_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/how_to/poisson_glm_plot_predictions/data/poisson.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Height: +d["X5_Height_in_cm"],
      Fit: +d["fit_exp"],
      Lower: +d["lwr"],
      Upper: +d["upr"],
    };
  }
);

console.log(fitted_data);

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
    label: "Heart rate (bpm)",
  },
  caption: "A Poisson regression of heart rate on height. Note the slight curve in the predicted fit.",
  marks: [
    Plot.dot(raw_data, { x: "Height", y: "Heart" }),
    Plot.areaY(fitted_data, { x: "Height", y1: "Lower", y2: "Upper", fillOpacity: 0.3 }),
    Plot.line(fitted_data, { x: "Height", y: "Fit" }),
  ]
});

const div = document.querySelector("#glm_plot");
div.append(plot);


