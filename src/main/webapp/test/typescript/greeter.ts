function greeter( person : String ) {
	return "Hello, " + person;
}

let user = "Test user";

document.body.textContent = greeter( user );