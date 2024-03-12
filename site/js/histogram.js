import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

// load csv from here:
// https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv
let csv = await d3.csv(
  "https://raw.githubusercontent.com/ARU-life-sciences/bioinformatics/main/R/statistics/data/form-1__anthropometrics.csv"
);

console.log(csv);
