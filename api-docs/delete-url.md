**Delete Short Url**
----
  Returns json data about a created url.

* **URL**

  /url/:short_url.json

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
   `short_url=[string]`

* **Success Response:**

  * **Code:** 204 <br />
    
 
* **Error Response:**

  * **Code:** 404 Record NOT FOUND <br />
    **Content:** `{
    "error": "Url doesn't exist",
    "status": 404
}`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/urls/:short_url",
      dataType: "json",
      type : "DELETE",
      success : function(r) {
        console.log(r);
      }
    });
  ```