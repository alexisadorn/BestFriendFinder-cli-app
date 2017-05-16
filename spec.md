# Specifications for the CLI Assessment

Specs:
- [X] Have a CLI for interfacing with the application
--> My CLI successfully welcomes the user, allows the user to make decisions by entering in numbers (and informs the user
if that number is incorrect), view details requested by the user, and allows the user to return to the beginning of the
application, to the middle of the application, or exit the application.

- [X] Pull data from an external source
--> Data is being pulled from the Best Friends Animal Society website, specifically under their adoption page. It is scraping
both the data from the list of animals available for adoption, as well as each individual animal's page.

- [X] Implement both list and detail views
--> The user is first presented with a list of all available animals based on the type of animal that the user specifies
(dogs, cats, etc.) This first-level list presents all animals and their name, breed and age. The user can then drill-down
into more details of each animal by choosing the animal they are interested in. They are presented with a more detailed views
which includes the initial informationa about the animal, as well as attributes such as size, sex, color and description.
