# SGrSpecifications
Contains the schema, functional profiles and external interface descriptions for SmartgridReady

#### Schema
For schema details see /SchemaDatabase/SGr/

#### Functional Profiles
/XMLInstances/FuncProfiles/ contains the published function profiles

#### External Interfaces
XMLInstances/ExtInterfaces/ contains the defined external interfaces.

## Visualization

The external interface XML can be visualized through xslt. As most browsers restrict access to cross-sites or local file systems, the XMLs need to be hosted.
- https://ergozeller.github.io/sgrTest/ contains a shadow copy that is manually updated by @ergozeller
- Alternatively you can easily setup a local web server.

Start the python webserver in the directory containg your local copy of the external interfaces

```
python -m http.server 8080
```

and open your broser http://localhost:8080
