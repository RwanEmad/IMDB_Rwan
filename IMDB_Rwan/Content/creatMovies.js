
var counter = 1;
function add_actor() {

    counter += 1
    html = 
         '<input type ="text" id="afname" name = "afname'+counter+'" placeholder="first name">\
         <input type="text" id="alname"  name= "alname'+counter+'" placeholder="last name">'

    var actors = document.getElementById('actors_name')
    actors.innerHTML+=html
}