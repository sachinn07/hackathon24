<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar Chart: Transactions vs. Amount</title>
    <style>
#typewriter h1 {
    overflow: hidden; /* Ensures the content is not revealed until the animation */
    border-right: .15em solid orange; /* The typewriter cursor */
    white-space: nowrap; /* Keeps the content on a single line */
    margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    letter-spacing: .15em; /* Adjust as needed */
    animation: typing 3.5s steps(40, end), blink-caret .75s step-end infinite;
}

@keyframes typing {
    from {
        width: 0;
    }
    to {
        width: 100%;
    }
}

@keyframes blink-caret {
    from, to {
        border-color: transparent;
    }
    50% {
        border-color: orange;
    }
}
 #chart-container, .container mt-5 {
    display: flex;
}
</style>
    <!-- Include Bootstrap CSS -->
 
<body>
<div style="background-color: #281d46; height: 70px; width: 100%;">
  <div style="height: 100px; width: 100px;">
 <img height=50 width=200 alt="image"  src="https://seeklogo.com/images/N/natwest-logo-FA71B898B1-seeklogo.com.png"> 
     </div>
  <div>
 
  </div>
 </div>
<div id="carddiv" class="row">
        <div class="col-sm-6" style="padding: 20px;"><div class="card" style="width: 60%; 
         margin-left: 20%"><div class="card-body">
    <div class="container mt-5">
        <h1 class="text-center">Bar Chart: Transactions vs. Amount</h1>
        <div id="chart-container" class="my-4"></div>
    </div>
</div></div></div></div>
    <!-- Include D3.js (you can replace this with your actual data) -->
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <script>
        // Sample data (replace with your actual data)
       const data = [
            { category: '0-10', transaction_count: 120, amount: 8 },
            { category: '11-50', transaction_count: 76, amount: 32 },
            { category: '51-100', transaction_count: 54, amount: 83 },
            { category: '101-250', transaction_count: 21, amount: 221 },
            { category: '251 and above', transaction_count: 5, amount: 988 },
            // Add other categories...
        ];
   /*     data.add(new Category("0-10", 8, 120));
       data.add(new Category("11-50", 32, 76));
       data.add(new Category("51-100", 83, 54));
       data.add(new Category("101-250", 221, 21));
       data.add(new Category("251 and above", 988, 5)); */

        // Set up the SVG container
        const svgWidth = 600;
        const svgHeight = 400;
        const margin = { top: 20, right: 20, bottom: 40, left: 40 };

        const svg = d3.select('#chart-container')
            .append('svg')
            .attr('width', svgWidth)
            .attr('height', svgHeight);

        // Calculate total transactions and total amount
        const totalTransactions = d3.sum(data, d => d.transaction_count);
        const totalAmount = d3.sum(data, d => d.amount);

        // Create scales
        const xScale = d3.scaleBand()
            .domain(data.map(d => d.category))
            .range([margin.left, svgWidth - margin.right])
            .padding(0.2);

        const yScale = d3.scaleLinear()
            .domain([0, 500])
            .nice()
            .range([svgHeight - margin.bottom, margin.top-600]);

        // Draw bars for transaction count
        svg.selectAll('.transaction-bar')
            .data(data)
            .enter()
            .append('rect')
            .attr('class', 'transaction-bar')
            .attr('x', d => xScale(d.category))
            .attr('y', d => yScale(d.transaction_count))
            .attr('width', xScale.bandwidth() / 2)
            .attr('height', d => svgHeight - margin.bottom - yScale(d.transaction_count))
            .attr('fill', 'steelblue');

        // Draw bars for amount
        svg.selectAll('.amount-bar')
            .data(data)
            .enter()
            .append('rect')
            .attr('class', 'amount-bar')
            .attr('x', d => xScale(d.category) + xScale.bandwidth() / 2)
            .attr('y', d => yScale(d.amount))
            .attr('width', xScale.bandwidth() / 2)
            .attr('height', d => svgHeight - margin.bottom - yScale(d.amount))
            .attr('fill', 'orange');

        // Add axes (optional)
        const xAxis = d3.axisBottom(xScale);
        const yAxis = d3.axisLeft(yScale);

        svg.append('g')
            .attr('transform', `translate(0, 360)`)
            .call(xAxis);

        svg.append('g')
            .attr('transform', `translate(60, 0)`)
            .call(yAxis);

        // Feel free to customize further!
    </script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
    <div id="carddiv" class="row">
        <div class="col-sm-6" style="padding: 20px;"><div class="card" style="width: 60%; 
         margin-left: 20%"><div class="card-body">
     <div id="typewriter">
     <p>Hi ${userName}</p> Here is your saving plan for ${amount} in ${timet} Months <br>
     ${seven} <br>some mere suggestion for you <br>
        <label>
           <!--  <input type="radio" name="option" value="option1"> --> One Month Savings..${one}
        </label>
       </br>
        <label>
           <!--  <input type="radio" name="option" value="option2">  -->Two Month Savings..   ${two}
        </label>
           </br>
        <label>
           <!--  <input type="radio" name="option" value="option3"> --> Three Month Savings ${three}
        </label>   </br>
        <label>
          <!--   <input type="radio" name="option" value="option4"> --> Four Month Savings. ${four}
        </label>   </br>
        <label>
           <!--  <input type="radio" name="option" value="option5">  -->Five Month Savings. ${five}
        </label>   </br>
        <label>
           <!--  <input type="radio" name="option" value="option6"> --> Six Month Savings..   ${six}
        </label>   </br>
  </div>
  </div></div></div></div>
  <form action="selectaccount" method="post">
   <h5> Amount: </h5>		<input type="text" name="seven" value='${seven}'><br>
  <button type="submit" class="btn btn-primary" value="/selectaccount">Submit</button>

</form>
</body>
</html>
