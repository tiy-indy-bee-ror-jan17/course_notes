// ECMAScript
// alert("Hello World!")

// my_variable = "3"
var my_variable = "3"
my_variable2 = "3"

console.log(my_variable)
console.log(my_variable2)

// my_variable + "4"
console.log("String multiplication: " + my_variable * "4")

// my_number = 3 #TypeError
my_number = 3
console.log(my_variable * my_number)

// nil
// null, undefined

my_trigger = null
my_other_trigger = "Hey"

// def method(args); end
function alert_this(string) {
  alert(string)
}

// if my_trigger

// if(my_trigger) {
//   alert_this("Hey")
// } else if(my_other_trigger === "Hey") {
//   alert_this("Hey now!")
// } else {
//   alert_this("Howdy")
// }

arr = []
// arr << "string"

arr.push("String1")
arr.push("String2")
arr.push("String3")

console.log(arr)

// arr.each do |thing|
//   puts thing
// end

// arr.each do |thing| end
// arr.forEach(function(thing){
//     alert_this(thing)
// })

arr.push(3)
arr.push(6)
arr.push(9)
arr.push(12)

arr = arr.concat([15,23,24,26,78])

divisibleByTwo = arr.filter(function(thing) {
  return thing % 2 === 0
})

// CourseStudents

// alert(divisibleByTwo.length)

multiplied = arr.filter(function(item){
  return typeof(item) === "number"
}).map(function(thing) {
  return thing * 2
}).reduce(function(sum, num){
  return sum + num
}, 0)

console.log(multiplied)

// {name: "hey", classroom: 23} # Hash
// {:name => "hey", :classroom => 23}
object = {name: "hey", classroom: 23}
console.log(object.name)
console.log(object.classroom)

var Person = {
  name: "Billy",
  speak: function(){
    alert("I am " + this.name)
  },
  height: 23
}

arr.push(
  {
    name: "Bobby",
    favorite_food: ["pizza", "burgers", "bread", "cheese"]
  }
)

arr.slice(-1)[0].favorite_food.forEach(function(food){
  console.log(food)
})

// initialize

class Robot {

  // initialize
  constructor(height, weight, bends){
    this.height = height
    this.weight = weight
    this.bends = bends
  }

  // Instance method
  get bend_this(){
    return "Bend " + this.bends + "!"
  }

  static madeOfMetal(){
    return true
  }

}

bender = new Robot(63, 230, "pipe")
console.log(bender.bend_this)
console.log(Robot.madeOfMetal())

element = document.getElementById('content')
element.innerHTML = "<h1>Hi Class</h1><h1>Hi ya'll</h1>"
headlines = document.querySelectorAll("#content h1")
headlines.forEach(function(header){
  header.innerHTML += ", it's Tuesday"
})
element.innerHTML += "<p>These bits of the page are inserted dynamically.</p>"
element.innerHTML += "<ul></ul>"
list = document.querySelector("#content ul")
arr.forEach(function(item){
  list.innerHTML += "<li>" + item + "</li>"
})

element.innerHTML += "<div id=\"starwars\"><h2>Films</h2><ul></ul></div>"

film_list = document.querySelector("#starwars ul")


fetch("http://swapi.co/api/films/")
.then(function(response){
  return response.json()
}).then(function(data){
  data.results.forEach(function(film){
    film_list.innerHTML += "<li>" + film.title + "</li>"
  })
})

console.log(JSON.stringify(arr))
