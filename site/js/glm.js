import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let raw_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Height: +d["5_Height_in_cm"],
      Heart: +d["19_Heart_rate_bpm_me"],
    };
  }
);

let fitted_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/how_to/poisson_glm_plot_predictions/data/poisson.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      Height: +d["5_Height_in_cm"],
      Fit: +d["fit_exp"],
      Lower: +d["lwr"],
      Upper: +d["upr"],
    };
  }
);

const plot = Plot.plot({
});

const div = document.querySelector("#glm_plot");
div.append(plot);


