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

const stats = [
  { stat: mean, type: "Mean of the data ↓"},
];

// plot height array as a histogram
const plot = Plot.plot({
  marginTop: 30,
  marginLeft: 80,
  marginBottom: 40,
  x: { label: "Height (cm) →" },
  caption: "A histogram of height data from students. The red line shows the mean of the data, ~168cm.",
  marks: [
      Plot.rectY(height, Plot.binX({y: "count"}, {x: {thresholds: 15, value: "height"}})),
      Plot.ruleX(stats, {x: "stat", stroke: "red", strokeWidth: 2}),
      Plot.text(stats, {x: "stat", y: 10, text: d => `${d.type}`, dy: -8, dx: 8, align: "start", textAnchor: "end"}),
      Plot.axisX({fontSize: 15}),
      Plot.axisY({fontSize: 15})
    ]
  }
);

const div = document.querySelector("#descriptive_plot");
div.append(plot);
