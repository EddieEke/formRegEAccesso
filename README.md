# formRegEAccesso
Una piccola web app in Spring Boot con l'accesso, la registrazione e il MyAccount utilizzando le 4 operazioni CRUD

{
	"info": {
		"_postman_id": "d3f6ca3f-219f-4993-b515-7c5a599b9d1c",
		"name": "powerbi",
		"schema": "https://schema.getpostman.com/json/collection/v2.0.0/collection.json"
	},
	"item": [
		{
			"name": "https://login.microsoftonline.com/51cc9718-2c01-4a5b-b258-5399ebafc611/oauth2/token",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "formdata",
					"formdata": [
						{
							"key": "grant_type",
							"value": "client_credentials",
							"type": "text"
						},
						{
							"key": "client_id",
							"value": "7cac0e6c-841a-48aa-951d-ab404a68cd69",
							"type": "text"
						},
						{
							"key": "client_secret",
							"value": "p-r7Q~eAm0K_A2gQ-fJsUhVsoZyv3sLPRigAo",
							"type": "text"
						},
						{
							"key": "tenant_id",
							"value": "51cc9718-2c01-4a5b-b258-5399ebafc611",
							"type": "text"
						},
						{
							"key": "resource",
							"value": "https://analysis.windows.net/powerbi/api",
							"type": "text"
						}
					]
				},
				"url": "https://login.microsoftonline.com/51cc9718-2c01-4a5b-b258-5399ebafc611/oauth2/token"
			},
			"response": []
		},
		{
			"name": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/ExportTo",
			"request": {
				"auth": {
					"type": "bearer",
					"bearer": {
						"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCIsImtpZCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCJ9.eyJhdWQiOiJodHRwczovL2FuYWx5c2lzLndpbmRvd3MubmV0L3Bvd2VyYmkvYXBpIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNTFjYzk3MTgtMmMwMS00YTViLWIyNTgtNTM5OWViYWZjNjExLyIsImlhdCI6MTYzMzY4NzE5MSwibmJmIjoxNjMzNjg3MTkxLCJleHAiOjE2MzM2OTEwOTEsImFpbyI6IkUyWmdZRGl6bWp0UXZNbnYwSGRad1hVZkJPWWVBUUE9IiwiYXBwaWQiOiI3Y2FjMGU2Yy04NDFhLTQ4YWEtOTUxZC1hYjQwNGE2OGNkNjkiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEvIiwib2lkIjoiZmZmNmFjMDEtNGMzZi00ZWY2LWJmZjEtNmJiOWMwZjQ3ZjM2IiwicmgiOiIwLkFUb0FHSmZNVVFFc1cwcXlXRk9aNjZfR0VXd09ySHdhaEtwSWxSMnJRRXBveldrNkFBQS4iLCJzdWIiOiJmZmY2YWMwMS00YzNmLTRlZjYtYmZmMS02YmI5YzBmNDdmMzYiLCJ0aWQiOiI1MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEiLCJ1dGkiOiJDYlBsZzFWOWowR2JaTDVmVHlTM0FBIiwidmVyIjoiMS4wIn0.oa2oZrTx3MI-sUK5T2tRAa_KdHKq91mbx97dgDvhIeyV9nluR1xYnY_PFvYohhuIsU5MBfzebYml8y5rMTW_TG-ZYGX_1VvtvpJXSiVaEzzZo6KEShWO1IZdeByPQtQcoq87ennXsIglbROc_IG2_KOgLPrJah1WzXGaO6WO0hT8Na9BVuAXOOX56gPJOZ57py5k7m2zhd-WC1RiqO37NF6wdW-Rzf5HLGtKywYQKrVy3Px4kCyuDHuNk1131i8KBmPpc6tEMWn-1w0UkZ8HOkLg-u9xrSpXzHCcsilRfyO2ZZLRp6a64lZgspOwZ-Ml33MC3QtxoI_gI15nZ8TwGw"
					}
				},
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\r\n       \"format\":\"XML\",\r\n       \"paginatedReportConfiguration\":{\r\n         \r\n          \"identities\":[\r\n             {\r\n                \"username\":\"daniele.ligorio-ext@ferrari.com\"\r\n              \r\n        }\r\n     ]\r\n   }\r\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/ExportTo"
			},
			"response": []
		},
		{
			"name": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/exports/MS9CbG9iSWRWMi03NzZhZGMxYy1iNDU4LTQ4NzYtYTg0Ni0xN2M3MWQxZWViYTJGb2hUYTdxVjZCR2d0NExIMWJZeW90ZmotWERmdGZQZXVLNjlHUHppRDFjPS4",
			"request": {
				"auth": {
					"type": "bearer",
					"bearer": {
						"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCIsImtpZCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCJ9.eyJhdWQiOiJodHRwczovL2FuYWx5c2lzLndpbmRvd3MubmV0L3Bvd2VyYmkvYXBpIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNTFjYzk3MTgtMmMwMS00YTViLWIyNTgtNTM5OWViYWZjNjExLyIsImlhdCI6MTYzMzY4NzE5MSwibmJmIjoxNjMzNjg3MTkxLCJleHAiOjE2MzM2OTEwOTEsImFpbyI6IkUyWmdZRGl6bWp0UXZNbnYwSGRad1hVZkJPWWVBUUE9IiwiYXBwaWQiOiI3Y2FjMGU2Yy04NDFhLTQ4YWEtOTUxZC1hYjQwNGE2OGNkNjkiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEvIiwib2lkIjoiZmZmNmFjMDEtNGMzZi00ZWY2LWJmZjEtNmJiOWMwZjQ3ZjM2IiwicmgiOiIwLkFUb0FHSmZNVVFFc1cwcXlXRk9aNjZfR0VXd09ySHdhaEtwSWxSMnJRRXBveldrNkFBQS4iLCJzdWIiOiJmZmY2YWMwMS00YzNmLTRlZjYtYmZmMS02YmI5YzBmNDdmMzYiLCJ0aWQiOiI1MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEiLCJ1dGkiOiJDYlBsZzFWOWowR2JaTDVmVHlTM0FBIiwidmVyIjoiMS4wIn0.oa2oZrTx3MI-sUK5T2tRAa_KdHKq91mbx97dgDvhIeyV9nluR1xYnY_PFvYohhuIsU5MBfzebYml8y5rMTW_TG-ZYGX_1VvtvpJXSiVaEzzZo6KEShWO1IZdeByPQtQcoq87ennXsIglbROc_IG2_KOgLPrJah1WzXGaO6WO0hT8Na9BVuAXOOX56gPJOZ57py5k7m2zhd-WC1RiqO37NF6wdW-Rzf5HLGtKywYQKrVy3Px4kCyuDHuNk1131i8KBmPpc6tEMWn-1w0UkZ8HOkLg-u9xrSpXzHCcsilRfyO2ZZLRp6a64lZgspOwZ-Ml33MC3QtxoI_gI15nZ8TwGw"
					}
				},
				"method": "GET",
				"header": [],
				"url": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/exports/MS9CbG9iSWRWMi03NzZhZGMxYy1iNDU4LTQ4NzYtYTg0Ni0xN2M3MWQxZWViYTJGb2hUYTdxVjZCR2d0NExIMWJZeW90ZmotWERmdGZQZXVLNjlHUHppRDFjPS4="
			},
			"response": []
		},
		{
			"name": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/exports/MS9CbG9iSWRWMi03NzZhZGMxYy1iNDU4LTQ4NzYtYTg0Ni0xN2M3MWQxZWViYTJGb2hUYTdxVjZCR2d0NExIMWJZeW90ZmotWERmdGZQZXVLNjlHUHppRDFjPS4",
			"request": {
				"auth": {
					"type": "bearer",
					"bearer": {
						"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCIsImtpZCI6Imwzc1EtNTBjQ0g0eEJWWkxIVEd3blNSNzY4MCJ9.eyJhdWQiOiJodHRwczovL2FuYWx5c2lzLndpbmRvd3MubmV0L3Bvd2VyYmkvYXBpIiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNTFjYzk3MTgtMmMwMS00YTViLWIyNTgtNTM5OWViYWZjNjExLyIsImlhdCI6MTYzMzY4NzE5MSwibmJmIjoxNjMzNjg3MTkxLCJleHAiOjE2MzM2OTEwOTEsImFpbyI6IkUyWmdZRGl6bWp0UXZNbnYwSGRad1hVZkJPWWVBUUE9IiwiYXBwaWQiOiI3Y2FjMGU2Yy04NDFhLTQ4YWEtOTUxZC1hYjQwNGE2OGNkNjkiLCJhcHBpZGFjciI6IjEiLCJpZHAiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEvIiwib2lkIjoiZmZmNmFjMDEtNGMzZi00ZWY2LWJmZjEtNmJiOWMwZjQ3ZjM2IiwicmgiOiIwLkFUb0FHSmZNVVFFc1cwcXlXRk9aNjZfR0VXd09ySHdhaEtwSWxSMnJRRXBveldrNkFBQS4iLCJzdWIiOiJmZmY2YWMwMS00YzNmLTRlZjYtYmZmMS02YmI5YzBmNDdmMzYiLCJ0aWQiOiI1MWNjOTcxOC0yYzAxLTRhNWItYjI1OC01Mzk5ZWJhZmM2MTEiLCJ1dGkiOiJDYlBsZzFWOWowR2JaTDVmVHlTM0FBIiwidmVyIjoiMS4wIn0.oa2oZrTx3MI-sUK5T2tRAa_KdHKq91mbx97dgDvhIeyV9nluR1xYnY_PFvYohhuIsU5MBfzebYml8y5rMTW_TG-ZYGX_1VvtvpJXSiVaEzzZo6KEShWO1IZdeByPQtQcoq87ennXsIglbROc_IG2_KOgLPrJah1WzXGaO6WO0hT8Na9BVuAXOOX56gPJOZ57py5k7m2zhd-WC1RiqO37NF6wdW-Rzf5HLGtKywYQKrVy3Px4kCyuDHuNk1131i8KBmPpc6tEMWn-1w0UkZ8HOkLg-u9xrSpXzHCcsilRfyO2ZZLRp6a64lZgspOwZ-Ml33MC3QtxoI_gI15nZ8TwGw"
					}
				},
				"method": "GET",
				"header": [],
				"url": "https://api.powerbi.com/v1.0/myorg/groups/552e6dac-20af-4611-a69e-87559bd8e2de/reports/ec46263f-2a7a-4ff5-82c7-fa2086535a3d/exports/MS9CbG9iSWRWMi03NzZhZGMxYy1iNDU4LTQ4NzYtYTg0Ni0xN2M3MWQxZWViYTJGb2hUYTdxVjZCR2d0NExIMWJZeW90ZmotWERmdGZQZXVLNjlHUHppRDFjPS4=/file"
			},
			"response": []
		}
	]
}
