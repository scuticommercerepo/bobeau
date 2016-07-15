Integration to run product feed for creating new products and upadating product information.

A) The file which needs to be imported should be converted into .xml format by saving as "XML Spreadsheet 2003.xml" 

NOTE: Make sure we dont have any special header in XLS when saving in XML format.



1) ProductCreate contains command control files to create product.

Product import will be run in create mode, we dont want to override any existing information for product therefore 
product import will be run in create mode only.

Command File :  ProductCreate.xml
Control File :  Enviroment specific control file in directory 
		


2) ProductUpdate contains command control files to update product.

Product import will be run in update mode for updating existing product information.  The fields which are defined in
ProductUpdate.xls will be updated only by running import feed.  


Command File :  ProductUpdate.xml
Control File :  Environment specific control file in directory 

