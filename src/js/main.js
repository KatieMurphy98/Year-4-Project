// set the dimensions and margins of the graph
var margin = { top: 30, right: 30, bottom: 70, left: 60 },
  width = 460 - margin.left - margin.right,
  height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3
  .select("#my_dataviz") // Selecting the correct div
  .append("svg") // Append the svg object
  .attr("width", width + margin.left + margin.right) // Set width
  .attr("height", height + margin.top + margin.bottom) // Set height
  .append("g") // 'g' is used to group svg elements together. This line adds margins to the svg object.
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")"); // use attr() to apply transform as an attribute of g
// Translates

// Parse the Data
d3.csv(
  (data = "C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/Data/Ninja Warrior/obstacles.csv"),
  function (data) {
    
    console.log(data);

    // X axis
    var x = d3
      .scaleBand() // Create new scale band
      .range([0, width]) // Range - accepted outputs
      .domain(
        data.map(function (d) {
          return d.name;
        })
      ) // Domain - accepted inputs
      .padding(0.2);

    svg
      .append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x))
      .selectAll("text")
      .attr("transform", "translate(-10,0)rotate(-45)")
      .style("text-anchor", "end");

    // Add Y axis
    var y = d3.scaleLinear().domain([0, 42]).range([height, 0]);

    svg.append("g").call(d3.axisLeft(y));

    // Bars
    svg
      .selectAll("mybar")
      .data(data)
      .enter()
      .append("rect")
      .attr("x", function (d) {
        return x(d.name);
      })
      .attr("y", function (d) {
        return y(d.ntimes);
      })
      .attr("width", x.bandwidth())
      .attr("height", function (d) {
        return height - y(d.ntimes);
      })
      .attr("fill", "#69b3a2");
  }
);
