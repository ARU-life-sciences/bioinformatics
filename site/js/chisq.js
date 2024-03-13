import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";
import * as Plot from "https://cdn.jsdelivr.net/npm/@observablehq/plot@0.6/+esm";

let raw_data = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv",
  function(d) {
    // get the variable 5_Height_in_cm and change to number
    return {
      gender: d["3_Gender"],
      smoker: d["8_Smoker"]
    };
  }
);

// iterate over raw_data and count the
// frequency of each combination
let count = {};
raw_data.forEach((d) => {
  let s = d.gender + "-" + d.smoker;
  if (!count[s]) {
    count[s] = 1;
  } else {
    count[s]++;
  }
});

let final = [];
for (const [key, value] of Object.entries(count)) {
  let k1 = key.split("-")[0];
  let k2 = key.split("-")[1];
  final.push({ Gender: k1, Smoker: k2, count: value });
}

const plot = Plot.plot({
  // required to center the plot
  style: {
    display: "block",
    margin: "auto",
  },
  width: 250,
  height: 250,
  marginLeft: 80,
  marginBottom: 70,
  caption: "A contingency table, or cross table of gender and smoking status. This data can be used to perform a Chi-squared test.",
  marks: [
    Plot.text(final, {x: "Gender", y: "Smoker", text: "count", fontSize: d => d.count / 1.1 < 5 ? 20 : d.count / 1.1 } ),
    Plot.axisX({fontSize: 18}),
    Plot.axisY({fontSize: 18})
  ]
});

const div = document.querySelector("#chi_sq_plot");
div.append(plot);


