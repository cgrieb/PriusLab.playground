// Lab -- Build a Prius
// Cindy Grieb

import UIKit

// this class defines a Prius
// multiple options can be selected for this car
//
class Prius {
    // this struct is used to keep option names together with their costs
    // for some reason we skipped the chapter on structs 
    // but it seems like the best fit for my data structure
    struct Options {
        var item : String
        var cost : Float
    }
    var model : Int     // an index into the array of modelNames
    let modelNames : [Options] = [
        Options(item:"Prius v Two",cost:26675.00),
        Options(item:"Prius v Three",cost:28060.00),
        Options(item:"Prius v Four",cost:29695.00),
        Options(item:"Prius v Five",cost:30935.00)]
    var color : Int     // an index into the array of colorChoices
    let colorChoices : [String] = [
        "Classic Silver Metallic",
        "Blizzard Pearl",
        "Absolutely Red",
        "Blue Ribbon Metallic",
        "Toasted Walnut Pearl",
        "Clear Sky Metallic",
        "Sea Glass Pearl",
        "Attitude Black Metallic",
        "Magnetic Gray Metallic"]
    var packages : [Int]    // an array of indices into the array of packageChoices
    let packageOptions : [Options] = [
        Options(item:"Advanced Technology Package",cost:3335.00)]
    var accessories : [Int] // an array of indices into the array of accessoriesChoices
    let accessoryOptions : [Options] = [
        Options(item:"All-Weather Floor Mats",cost:100.00),
        Options(item:"Ashtray Cup",cost:69.00),
        Options(item:"Cargo Net - Envelope",cost:49.00),
        Options(item:"Cargo Tote",cost:49.00),
        Options(item:"Cargo Tray",cost:100.00),
        Options(item:"Carpet Cargo Mat",cost:95.00),
        Options(item:"Carpet Floor Mats",cost:130.00),
        Options(item:"Emergency Assistance Kit",cost:59.00),
        Options(item:"First Aid Kit",cost:30.00),
        Options(item:"Key Finder",cost:79.00),
        Options(item:"Remote Engine Starter",cost:499.00),
        Options(item:"Vehicle Intrusion Protection (VIP) Security System",cost:359.00),
        Options(item:"Alloy Wheel Locks",cost:69.00),
        Options(item:"Door Edge Guards",cost:125.00),
        Options(item:"Mudguards",cost:155.00),
        Options(item:"Paint Protection Film",cost:395.00),
        Options(item:"Rear Bumper Applique",cost:69.00),
        Options(item:"All-Weather Mat Package",cost:200.00),
        Options(item:"Carpet Mat Package",cost:225.00),
        Options(item:"Four Season Floor Mat Package",cost:325.00),
        Options(item:"Preferred Accessory Package Z1",cost:304.00),
        Options(item:"Preferred Accessory Package Z5",cost:343.00)]
    
    // the init function -- defines a basic Prius
    init() {
        model = 0               // grab the first model choice
        color = 0               // grab the first color choice
        packages = [Int]()      // no packages selected
        accessories = [Int]()   // no packages selected
    }
    
    // this function displays the chosen car with all the details
    // we haven't learned anything about formatting numeric output 
    // so there are no commas or double digits after the decimal in cost
    func displayPrius() {
        print("\n\n\(modelNames[self.model].item)")
        print("\tColor: \(colorChoices[self.color])")
        if packages.count > 0 {
            print("\tPackages selected:")
            for var i = 0; i < packages.count; i++ {
                print("\t\t\(packageOptions[self.packages[i]].item)")
            }
        }
        if accessories.count > 0 {
            print("\tAccessories selected:")
            for var i = 0; i < accessories.count; i++ {
                print("\t\t\(accessoryOptions[self.accessories[i]].item)")
            }
        }
        print("Total cost for this car: $\(calcTotalCost())")
    }
    
    // this function checks to see if the string given is a valid model
    // if so, it sets the model value for this instance
    func setModel(m: String) -> Bool {
        for var i = 0; i < modelNames.count; i++ {
            if modelNames[i].item == m {
                self.model = i
                return true
            }
        }
        return false
    }

    // this function checks to see if the string given is a valid color
    // if so, it sets the color value for this instance
    func setColor(c: String) -> Bool {
        for var i = 0; i < colorChoices.count; i++ {
            if colorChoices[i] == c {
                self.color = i
                return true
            }
        }
        return false
    }
    
    // this function checks to see if the string given is a valid package
    // if so, it adds the package to this instance
    // if the package already exists, it is removed
    // if the given string is not a valid option, it returns false
    func setPackages(p: String) -> Bool {
        var option = -1
        for var i = 0; i < packageOptions.count; i++ {
            if packageOptions[i].item == p {
                option = i
                break
            }
        }
        if option > -1 {
            if packages.count > 0 {  // don't duplicate
                for var i = 0; i < packages.count; i++ {
                    if packages[i] == option {
                        packages.removeAtIndex(i)  // found - remove it
                        return true
                    }
                }
                packages.append(option)  // not found -- add it
                return true
            } else {
                packages.append(option)  // none chosen -- add it
                return true
            }
        }
        return false
    }
    
    // this function checks to see if the string given is a valid accessory
    // if so, it adds the accessory to this instance
    // if the accessory already exists, it is removed
    // if the given string is not a valid option, it returns false
    func setAccessory(a: String) -> Bool {
        var option = -1
        for var i = 0; i < accessoryOptions.count; i++ {
            if accessoryOptions[i].item == a {
                option = i
                break
            }
        }
        if option > -1 {
            if accessories.count > 0 {  // don't duplicate
                for var i = 0; i < accessories.count; i++ {
                    if accessories[i] == option {
                        accessories.removeAtIndex(i)  // found - remove it
                        return true
                    }
                }
                accessories.append(option)  // not found -- add it
                return true
            } else {
                accessories.append(option)  // none chosen -- add it
                return true
            }
        }
        return false
    }
    
    // calculate the total cost of the model and options selected
    func calcTotalCost() -> Float {
        var totalCost : Float = 0.0
        // find the model and add the cost to the total
        totalCost += modelNames[self.model].cost
        // find all of the package options selected and add the cost to the total
        if packages.count > 0 {
            for var i = 0; i < packages.count; i++ {
                totalCost += packageOptions[self.packages[i]].cost
            }
        }
        // find all of the accessories selected and add the cost to the total
        if accessories.count > 0 {
            for var i = 0; i < accessories.count; i++ {
                totalCost += accessoryOptions[self.accessories[i]].cost
            }
        }
        return totalCost
    }
}

var myPrius = Prius()
myPrius.displayPrius()

var ultraPrius = Prius()
ultraPrius.setModel("Prius v Five")
ultraPrius.setColor("Blizzard Pearl")
ultraPrius.setPackages("Advanced Technology Package")
ultraPrius.setAccessory("Emergency Assistance Kit")
ultraPrius.setAccessory("Remote Engine Starter")
ultraPrius.setAccessory("Paint Protection Film")
ultraPrius.setAccessory("Door Edge Guards")
ultraPrius.displayPrius()

