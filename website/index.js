const d3 = require("d3");

const data = d3.csv("data/clean_data_merged.csv", (data) => {
    for (let i = 0; i < data.length; i++) {
        console.log(data[i]);
    }
})

// console.log(data)
