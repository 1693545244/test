import xml.etree.ElementTree as ET
treenew = ET.parse('country_data.xml')
treeold = ET.parse('country_data.xml')
rootnew = treenew.getroot()
rootold = treenew.getroot()
dicold={}
dickey=""

dicoldkey=""
dicoldvalue=""

for child1 in rootold:
    for child2 in child1:
        for child3 in child2:
            if(child3.tag == "source"):
                dicoldkey = child3.text
            if(child3.tag == "translation"):
                dicoldvalue = child3.text
                dicold[dicoldkey] = dicoldvalue


for child1 in rootnew:
    for child2 in child1:
        for child3 in child2:
            if(child3.tag == "source"):
                if(dicold.__contains__(child3.text)):
                    dickey = child3.text
                    continue
            if(child3.tag == "translation"):
                child3.text = dicold[dickey]

treenew.write("test.xml")
