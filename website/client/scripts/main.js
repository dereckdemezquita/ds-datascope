
const data = d3.csv("data/clean_data_merged.csv", (err, data) => {
    if(err) return err;
});



console.log(data)