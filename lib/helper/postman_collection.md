{
  "info": {
    "_postman_id": "ac970cfb-4806-414e-a510-2070feb4025e",
    "name": "Gymmate DEV",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
    "_exporter_id": "35228799"
  },
  "item": [
    {
      "name": "register",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "key": "user_name",
              "value": "sameer teest",
              "type": "text"
            },
            {
              "key": "gym_name",
              "value": "sameertestgym",
              "type": "text"
            },
            {
              "key": "email",
              "value": "sameertestgym@gmail.com",
              "type": "text"
            },
            {
              "key": "gym_image",
              "type": "file",
              "src": "/C:/Users/danis/Downloads/WhatsApp Image 2026-02-16 at 17.15.22.jpeg"
            },
            {
              "key": "role",
              "value": "admin",
              "type": "text"
            },
            {
              "key": "location",
              "value": "worli",
              "type": "text"
            },
            {
              "key": "address",
              "value": "worli 400018",
              "type": "text"
            },
            {
              "key": "password",
              "value": "123456",
              "type": "text",
              "uuid": "31908b95-2b64-4d84-a1b5-0c10ad8f646c"
            },
            {
              "key": "phone_number",
              "value": "11111223352223",
              "type": "text",
              "uuid": "967969fb-3002-4575-8c92-5f789adf37d2"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/register",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "register"
          ]
        }
      },
      "response": []
    },
    {
      "name": "login",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "urlencoded",
          "urlencoded": [
            {
              "key": "email",
              "value": "danishgym@gmail.com",
              "type": "text"
            },
            {
              "key": "password",
              "value": "123456",
              "type": "text"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/login",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "login"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get user",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"a9838d2d-8f82-4640-938b-c8d1716b309c\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/user",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "user"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create trainnig mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Authorization",
            "value": "",
            "type": "text",
            "disabled": true
          },
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\": \"updated\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/training-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get training mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/training-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update training mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"fd541270-68cf-4e44-96fa-671d3747e587\",\r\n    \"name\": \"updated30\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/training-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete training mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"fd541270-68cf-4e44-96fa-671d3747e587\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/training-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create lead category",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"cate1\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-categories",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-categories"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get lead category",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/lead-categories",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-categories"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update lead category",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"39e49404-4ec5-4a0e-813f-5fee91937bed\",\r\n    \"name\": \"testting321\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-categories",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-categories"
          ]
        }
      },
      "response": []
    },
    {
      "name": "Delete lead category",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"849722f0-f2ef-4b9b-90c4-2702ebe2aa72\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-categories",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-categories"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create lead status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"aiga confirm\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-statuses",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-statuses"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get lead status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/lead-statuses",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-statuses"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update lead status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"e9e068a4-93d6-46bc-a942-694c080c373a\",\r\n    \"name\":\"aiga testconfirm\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-statuses",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-statuses"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete  lead status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"e9e068a4-93d6-46bc-a942-694c080c373a\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-statuses",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-statuses"
          ]
        }
      },
      "response": []
    },
    {
      "name": "craete lead_follow_type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"whatsaap\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-follow-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-follow-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get lead_follow_type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/lead-follow-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-follow-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update lead_follow_type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"9e06b5fe-82df-4485-b9e6-db91868f7ef6\",\r\n    \"name\":\"whatsaaptest\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-follow-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-follow-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete lead_follow_type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"9e06b5fe-82df-4485-b9e6-db91868f7ef6\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-follow-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-follow-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create leadsource",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"insta\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get leadsource",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/lead-sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update leadsource",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"4b04d148-07c2-4132-b3e5-8a9601805660\",\r\n    \"name\":\"whatsaaptest\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete leadsource",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"4b04d148-07c2-4132-b3e5-8a9601805660\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/lead-sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "lead-sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create trainnig type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n  \"name\": \"check\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/training-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "gettraining type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/training-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update training type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"11fc967b-5e3c-4196-aeb3-a4c6e7e4a597\",\r\n    \"name\":\"whatsaaptest\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/training-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete training type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"11fc967b-5e3c-4196-aeb3-a4c6e7e4a597\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/training-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "training-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create plan",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \r\n    \"name\": \"2platinum\",\r\n    \"price\": \"179999.00\",\r\n    \"duration_months\":\"25\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/plans",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "plans"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get plan",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "url": {
          "raw": "{{URL}}/plans",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "plans"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update plan",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"31d69ead-8042-4eb8-af37-4440b1ae908e\",\r\n    \"name\":\"whatsaaptest\",\r\n    \"price\":\"20000\",\r\n    \"duration_months\":\"5\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/plans",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "plans"
          ]
        }
      },
      "response": []
    },
    {
      "name": "Delete plan",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"31d69ead-8042-4eb8-af37-4440b1ae908e\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/plans",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "plans"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create group",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\": \"test-grouoo\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/groups",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "groups"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get group",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "url": {
          "raw": "{{URL}}/groups",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "groups"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update group",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"ea2b2a18-4af3-4c0a-a6d4-0669807f02d4\",\r\n    \"name\":\"update group test\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/groups",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "groups"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete  group",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"ea2b2a18-4af3-4c0a-a6d4-0669807f02d4\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/groups",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "groups"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create goals",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"create goals\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/goals",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "goals"
          ]
        }
      },
      "response": []
    },
    {
      "name": "getgoal",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "url": {
          "raw": "{{URL}}/goals",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "goals"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update goal",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"8aaabb3e-cfb3-4b90-96be-0b016a1a0667\",\r\n    \"name\":\"whatsaaptestupdate goal\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/goals",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "goals"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete goal",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"8aaabb3e-cfb3-4b90-96be-0b016a1a0667\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/goals",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "goals"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create sources",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\":\"create sources test\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get sources",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "url": {
          "raw": "{{URL}}/sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update sources",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"51b46b50-9666-40a0-8c0a-0ae39af17044\",\r\n    \"name\": \"testdjdjbdsjd\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete sources",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"51b46b50-9666-40a0-8c0a-0ae39af17044\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/sources",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "sources"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create members",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "key": "name",
              "value": "test member 20",
              "type": "text"
            },
            {
              "key": "gender",
              "value": "male",
              "type": "text"
            },
            {
              "key": "mobile_number",
              "value": "0009999333",
              "type": "text"
            },
            {
              "key": "alternate_mobile",
              "value": "5555434332",
              "type": "text"
            },
            {
              "key": "email",
              "value": "testme33ber20@email.com",
              "type": "text"
            },
            {
              "key": "age",
              "value": "24",
              "type": "text"
            },
            {
              "key": "plan_id",
              "value": "b9d59f52-739f-4784-9c6d-876a702c2fc4",
              "type": "text"
            },
            {
              "key": "training_mode_id",
              "value": "66f608b6-9d71-481a-95bb-796095416c91",
              "type": "text"
            },
            {
              "key": "training_type_id",
              "value": "38f0067e-558b-49c0-9000-f0891b47d962",
              "type": "text"
            },
            {
              "key": "goal_id",
              "value": "303ef7ed-4981-45e7-a16d-0ac7f3b84bc8",
              "type": "text"
            },
            {
              "key": "source_id",
              "value": "4a272022-3294-4982-83e3-eb2c05819915",
              "type": "text"
            },
            {
              "key": "group_id",
              "value": "2eb0064b-f588-4ec8-82ca-b6f72a52d788",
              "type": "text"
            },
            {
              "key": "health_condition",
              "value": "No significant health conditions",
              "type": "text"
            },
            {
              "key": "address",
              "value": "456 Park Avenue, Mumbai, Maharashtra",
              "type": "text"
            },
            {
              "key": "joining_date",
              "value": "2025-12-16",
              "type": "text"
            },
            {
              "key": "amount",
              "value": "6000.00",
              "type": "text"
            },
            {
              "key": "balance_date",
              "value": "2026/12/19",
              "type": "text"
            },
            {
              "key": "payment_mode",
              "value": "8016cd74-123e-4e83-9118-edcd67f68b09",
              "type": "text"
            },
            {
              "key": "image",
              "type": "file",
              "uuid": "d2f7e790-fab1-4bd7-88c4-f35219968ad5",
              "src": "postman-cloud:///1f0b6446-327f-4600-b9da-8f84bd55e259"
            },
            {
              "key": "discount",
              "value": "20",
              "type": "text",
              "uuid": "7e02a2e5-c89f-4eb5-b73e-4d25b1f12248"
            },
            {
              "key": "bmr_data",
              "value": "{\n    \"member_id\": \"a3c60136-fec0-4ec7-9976-3fbedcb3afba\",\n    \"gender\": \"male\",\n    \"age\": 23,\n    \"weight\": 15,\n    \"height\": 75,\n    \"heart_rate_rest\": \"65\",\n    \"heart_rate_treadmill\": \"140\",\n    \"push_up\": \"02\",\n    \"curl_up\": \"0\",\n    \"mobility\": \"poor\",\n    \"sit_reach\": \"15\",\n    \"profession\": \"cloud Developer\",\n    \"work_time_start\": \"10:30\",\n    \"work_time_end\": \"19:30\",\n    \"meal1_time\": \"09:00\",\n    \"meal2_time\": \"14:00\",\n    \"meal3_time\": \"2:00\",\n    \"aims\": \"weight loss, muscle gain\",\n    \"chest\": 102,\n    \"hips\": 400,\n    \"stomach\": 485,\n    \"thigh\": 260,\n    \"body_age\": 28\n}",
              "type": "text",
              "uuid": "8e608393-f52f-45a3-8556-04f886045bf4",
              "disabled": true
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/members",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update members",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "type": "text",
              "key": "id",
              "value": "8c3c0f1b-7ed5-4615-b554-29dacc214acc"
            },
            {
              "type": "text",
              "key": "name",
              "value": "Updated Member Name"
            },
            {
              "type": "text",
              "key": "gender",
              "value": "male"
            },
            {
              "type": "text",
              "key": "mobile_number",
              "value": "9999999999"
            },
            {
              "type": "text",
              "key": "alternate_mobile",
              "value": "8888888888"
            },
            {
              "type": "text",
              "key": "email",
              "value": "updated@email.com"
            },
            {
              "type": "text",
              "key": "age",
              "value": "25"
            },
            {
              "type": "text",
              "key": "plan_id",
              "value": "b9d59f52-739f-4784-9c6d-876a702c2fc4"
            },
            {
              "type": "text",
              "key": "training_mode_id",
              "value": "66f608b6-9d71-481a-95bb-796095416c91"
            },
            {
              "type": "text",
              "key": "training_type_id",
              "value": "38f0067e-558b-49c0-9000-f0891b47d962"
            },
            {
              "type": "text",
              "key": "goal_id",
              "value": "303ef7ed-4981-45e7-a16d-0ac7f3b84bc8"
            },
            {
              "type": "text",
              "key": "source_id",
              "value": "4a272022-3294-4982-83e3-eb2c05819915"
            },
            {
              "type": "text",
              "key": "group_id",
              "value": "2eb0064b-f588-4ec8-82ca-b6f72a52d788"
            },
            {
              "type": "text",
              "key": "health_condition",
              "value": "Updated health condition"
            },
            {
              "type": "text",
              "key": "address",
              "value": "789 Updated Street, New City"
            },
            {
              "type": "text",
              "key": "joining_date",
              "value": "2025-12-20"
            },
            {
              "type": "text",
              "key": "amount",
              "value": "7000.00"
            },
            {
              "type": "text",
              "key": "discount",
              "value": "15"
            },
            {
              "type": "text",
              "key": "balance_date",
              "value": "2026-01-20"
            },
            {
              "type": "file",
              "key": "image",
              "src": "/C:/Users/danis/Downloads/WhatsApp Image 2026-01-20 at 5.40.13 PM.jpeg"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/members",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get all members",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/members",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete members",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"a3c60136-fec0-4ec7-9976-3fbedcb3afba\",\r\n    \"email\": \"updated@email.com\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/members",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member export",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/members/export",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members",
            "export"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member bulk import",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "key": "file",
              "type": "file",
              "uuid": "961b70f7-360a-4423-a1cf-13cd6b47e58a",
              "src": "/C:/Users/danis/Downloads/multiple_leads_export.xlsx"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/members/bulk-import",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members",
            "bulk-import"
          ]
        }
      },
      "response": []
    },
    {
      "name": "transfer member",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n     \"from_member_id\":\"3786abc5-9489-4251-8fc3-2713be9b6358\",\r\n      \"to_member_id\":\"8c3c0f1b-7ed5-4615-b554-29dacc214acc\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/members/transfer",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members",
            "transfer"
          ]
        }
      },
      "response": []
    },
    {
      "name": "freeze member",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json",
            "type": "text"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"member_id\":\"3786abc5-9489-4251-8fc3-2713be9b6358\"\r\n}"
        },
        "url": {
          "raw": "{{URL}}/members/freeze",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members",
            "freeze"
          ]
        }
      },
      "response": []
    },
    {
      "name": "unfreeze",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"member_id\":\"3786abc5-9489-4251-8fc3-2713be9b6358\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/members/unfreeze",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "members",
            "unfreeze"
          ]
        }
      },
      "response": []
    },
    {
      "name": "getimage",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/user/image?email=testimage@gmail.com",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "user",
            "image"
          ],
          "query": [
            {
              "key": "email",
              "value": "testimage@gmail.com"
            }
          ]
        }
      },
      "response": []
    },
    {
      "name": "get all payments",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n  \"member_id\": \"256b97bc-4471-4ac7-9bcd-dd0992d4bc43\",\r\n  \"add_amount\": 1000\r\n  \r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payments/pending",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payments",
            "pending"
          ]
        }
      },
      "response": []
    },
    {
      "name": "payment/pending",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payments/pending",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payments",
            "pending"
          ]
        }
      },
      "response": []
    },
    {
      "name": "add-leads",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "key": "name",
              "value": "2nd lead",
              "type": "text"
            },
            {
              "key": "plan",
              "value": "e1040480-1a8c-4a64-a816-f473d2af0e02",
              "type": "text"
            },
            {
              "key": "expected_date",
              "value": " 2025-12-31",
              "type": "text"
            },
            {
              "key": "leadcategory_id",
              "value": "db0f3c0f-62f6-462d-9a7c-6c787e565249",
              "type": "text"
            },
            {
              "key": "leadfollowtype_id",
              "value": "d5f8716b-1238-46ab-b620-a47d62ff9b79",
              "type": "text"
            },
            {
              "key": "leadsource_id",
              "value": "c3d393cc-d24d-4aa6-8ee2-5b3d5d87e04d",
              "type": "text"
            },
            {
              "key": "leadstatus_id",
              "value": "f7751da9-9c55-495a-9a72-3d596f36269a",
              "type": "text"
            },
            {
              "key": "description",
              "value": " description for 3nd lead updated",
              "type": "text"
            },
            {
              "key": "image",
              "type": "file",
              "uuid": "d09f4169-c7e1-4ab2-b1e3-f1e452b61562",
              "src": "postman-cloud:///1f0b6446-327f-4600-b9da-8f84bd55e259"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/all-leads",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "all-leads"
          ]
        }
      },
      "response": []
    },
    {
      "name": "convert lead to member",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          },
          {
            "key": "Authorization",
            "value": "Bearer YOUR_JWT_TOKEN"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n    \"lead_id\": \"3ab01ade-4586-4f28-b0f4-1b18bcc55179\",\n    \"mobile_number\": \"9876543210\",\n    \"email\": \"john.doe@example.com\",\n    \"joining_date\": \"2024-01-15\",\n    \"amount\": 500,\n    \"discount\": 10,\n    \"gender\": \"male\",\n    \"age\": 30,\n    \"address\": \"123 Main St, City\",\n    \"payment_mode\": \"88fa0678-04a8-4a32-a561-c4d7f6bf4393\",\n    \"balance_date\": \"2024-02-15\"\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/all-leads/convert",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "all-leads",
            "convert"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get all leads",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/all-leads",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "all-leads"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update lead",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmI0OGFhLTFjOWItNGM4YS05ZWRkLTg3M2I4NmNmN2ZhNiIsImVtYWlsIjoidGVzdGltYWdlQGdtYWlsLmNvbSIsInJvbGVfaWQiOjIsInR5cGUiOiJ1c2VyIiwiaWF0IjoxNzczMzAxNDAyLCJleHAiOjE3NzM5MDYyMDJ9.GKOBRX8QXE6w5ZZpSUuK3OmG12CY2DZeJgst7R4R0g8"
          }
        ],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "type": "text",
              "key": "id",
              "value": "54813170-cd74-4ae7-acde-6bb0b2b52cfe"
            },
            {
              "type": "text",
              "key": "name",
              "value": "Updated Lead Name"
            },
            {
              "type": "text",
              "key": "email",
              "value": "updated.lead@email.com"
            },
            {
              "type": "text",
              "key": "mob_no",
              "value": "9999999999"
            },
            {
              "type": "text",
              "key": "gender",
              "value": "male"
            },
            {
              "type": "text",
              "key": "plan",
              "value": "e1040480-1a8c-4a64-a816-f473d2af0e02"
            },
            {
              "type": "text",
              "key": "expected_date",
              "value": "2025-12-31"
            },
            {
              "type": "text",
              "key": "leadcategory_id",
              "value": "db0f3c0f-62f6-462d-9a7c-6c787e565249"
            },
            {
              "type": "text",
              "key": "leadfollowtype_id",
              "value": "d5f8716b-1238-46ab-b620-a47d62ff9b79"
            },
            {
              "type": "text",
              "key": "leadsource_id",
              "value": "c3d393cc-d24d-4aa6-8ee2-5b3d5d87e04d"
            },
            {
              "type": "text",
              "key": "leadstatus_id",
              "value": "f7751da9-9c55-495a-9a72-3d596f36269a"
            },
            {
              "type": "text",
              "key": "description",
              "value": "Updated description for the lead"
            },
            {
              "type": "file",
              "key": "image",
              "src": "/C:/Users/danis/Downloads/WhatsApp Image 2026-01-20 at 5.42.21 PM.jpeg"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/all-leads",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "all-leads"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete lead",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmI0OGFhLTFjOWItNGM4YS05ZWRkLTg3M2I4NmNmN2ZhNiIsImVtYWlsIjoidGVzdGltYWdlQGdtYWlsLmNvbSIsInJvbGVfaWQiOjIsInR5cGUiOiJ1c2VyIiwiaWF0IjoxNzczMzAxNDAyLCJleHAiOjE3NzM5MDYyMDJ9.GKOBRX8QXE6w5ZZpSUuK3OmG12CY2DZeJgst7R4R0g8"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"8f46d215-a6f4-410a-8143-82349e0c876c\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/all-leads",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "all-leads"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create payment mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\": \"test\"\r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payment-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get all payment mode",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/payment-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update payment modes",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"553857f9-7ab6-442f-bb36-e309168f99de\",\r\n    \"name\":\"sadjfhasjd\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payment-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete payment modes",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\":\"553857f9-7ab6-442f-bb36-e309168f99de\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payment-modes",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-modes"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create payment_status",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\": \"failed\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payments/pending",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payments",
            "pending"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get payment status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/payment-status",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-status"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update payment status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n       \"id\": \"c37600b0-1a48-421d-a494-8e8fa9707919\",\r\n       \"name\":\"fsdfsdf\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payment-status",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-status"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete payment status",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n       \"id\": \"c37600b0-1a48-421d-a494-8e8fa9707919\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/payment-status",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "payment-status"
          ]
        }
      },
      "response": []
    },
    {
      "name": "export payment status",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n       \"id\": \"c37600b0-1a48-421d-a494-8e8fa9707919\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}//payment-status/export",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "",
            "payment-status",
            "export"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create employee type",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"name\": \"accountent\"\r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/employee-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get employee type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/employee-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update employee type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"a16c435b-e9fe-4367-9b14-22d50df2d908\",\r\n    \"name\": \"accountentssss\"\r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/employee-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete employee type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"id\": \"a16c435b-e9fe-4367-9b14-22d50df2d908\"\r\n}\r\n",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/employee-types",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-types"
          ]
        }
      },
      "response": []
    },
    {
      "name": "exportemployee type",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/employee-types/export",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-types",
            "export"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create employee",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "key": "name",
              "value": "danish",
              "type": "text"
            },
            {
              "key": "email",
              "value": "danishs@gmail.com",
              "type": "text"
            },
            {
              "key": "gender",
              "value": "male",
              "type": "text"
            },
            {
              "key": "employee_type_id",
              "value": "eb6c6b50-683c-4c4d-9557-fe9251ada202",
              "type": "text"
            },
            {
              "key": "group_id",
              "value": "4df7e8bb-65eb-490e-ad34-89a54a7d3697",
              "type": "text"
            },
            {
              "key": "contact_no",
              "value": "121221131123",
              "type": "text"
            },
            {
              "key": "username",
              "value": "1shamstraimerBolte",
              "type": "text"
            },
            {
              "key": "date_of_birth",
              "value": "1995-05-20",
              "type": "text"
            },
            {
              "key": "date_of_anniversary",
              "value": "2022-06-15",
              "type": "text"
            },
            {
              "key": "joining_date",
              "value": "2026-01-10",
              "type": "text"
            },
            {
              "key": "address",
              "value": "123 Wellness St, Fitness City, 12345",
              "type": "text"
            },
            {
              "key": "image",
              "type": "file",
              "uuid": "c7c3d23a-5402-4993-942b-72e811831417",
              "src": "postman-cloud:///1f0b6446-327f-4600-b9da-8f84bd55e259"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/employees",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employees"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get employee",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "formdata",
          "formdata": []
        },
        "url": {
          "raw": "{{URL}}/employees",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employees"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update employee",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmI0OGFhLTFjOWItNGM4YS05ZWRkLTg3M2I4NmNmN2ZhNiIsImVtYWlsIjoidGVzdGltYWdlQGdtYWlsLmNvbSIsInJvbGVfaWQiOjEsInR5cGUiOiJ1c2VyIiwiaWF0IjoxNzczMzAxNDAyLCJleHAiOjE3NzM5MDYyMDJ9.GKOBRX8QXE6w5ZZpSUuK3OmG12CY2DZeJgst7R4R0g8"
          }
        ],
        "body": {
          "mode": "formdata",
          "formdata": [
            {
              "type": "text",
              "key": "id",
              "value": "b1e47eb3-3158-455e-9378-9e43c6073bcd"
            },
            {
              "type": "text",
              "key": "name",
              "value": "Updated Employee Name"
            },
            {
              "type": "text",
              "key": "email",
              "value": "updated.employee@email.com"
            },
            {
              "type": "text",
              "key": "gender",
              "value": "male"
            },
            {
              "type": "text",
              "key": "employee_type_id",
              "value": "34319dc3-de2e-46b9-aa87-fa81ef1fc6c9"
            },
            {
              "type": "text",
              "key": "group_id",
              "value": "4df7e8bb-65eb-490e-ad34-89a54a7d3697"
            },
            {
              "type": "text",
              "key": "contact_no",
              "value": "9999999999"
            },
            {
              "type": "text",
              "key": "date_of_birth",
              "value": "1990-01-01"
            },
            {
              "type": "text",
              "key": "date_of_anniversary",
              "value": "2020-01-01"
            },
            {
              "type": "text",
              "key": "joining_date",
              "value": "2024-01-01"
            },
            {
              "type": "text",
              "key": "address",
              "value": "456 Updated Street, New City, 400001"
            },
            {
              "type": "file",
              "key": "image",
              "src": "/C:/Users/danis/Downloads/WhatsApp Image 2025-12-29 at 7.02.03 PM.jpeg"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/employees",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employees"
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete employee",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmI0OGFhLTFjOWItNGM4YS05ZWRkLTg3M2I4NmNmN2ZhNiIsImVtYWlsIjoidGVzdGltYWdlQGdtYWlsLmNvbSIsInJvbGVfaWQiOjEsInR5cGUiOiJ1c2VyIiwiaWF0IjoxNzczMzAxNDAyLCJleHAiOjE3NzM5MDYwMDB9.GKOBRX8QXE6w5ZZpSUuK3OmG12CY2DZeJgst7R4R0g8"
          }
        ],
        "url": {
          "raw": "https://gymgennie.dynsimulation.com/api/v1/gymmate/employees/b1e47eb3-3158-455e-9378-9e43c6073bcd",
          "protocol": "https",
          "host": [
            "gymgennie",
            "dynsimulation",
            "com"
          ],
          "path": [
            "api",
            "v1",
            "gymmate",
            "employees",
            "b1e47eb3-3158-455e-9378-9e43c6073bcd"
          ]
        }
      },
      "response": []
    },
    {
      "name": "employee attandance check-in",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"employee_id\":\"453d66e6-bd7c-4783-82dc-f0cd8f882a32\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/employee-attendance/check-in",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-attendance",
            "check-in"
          ]
        }
      },
      "response": []
    },
    {
      "name": "employee attandance check out",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"employee_id\":\"453d66e6-bd7c-4783-82dc-f0cd8f882a32\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/employee-attendance/check-out",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-attendance",
            "check-out"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get employee attandance",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/employee-attendance",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "employee-attendance"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member attandance check in",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"member_id\":\"40c0a7ca-11e4-42cc-9973-1c92c3469a24\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/member-attendance/check-in",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "member-attendance",
            "check-in"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member attandance",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/member-attendance",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "member-attendance"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member attandance checkout",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [],
        "body": {
          "mode": "raw",
          "raw": "{\r\n    \"member_id\":\"40c0a7ca-11e4-42cc-9973-1c92c3469a24\"\r\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/member-attendance/check-out",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "member-attendance",
            "check-out"
          ]
        }
      },
      "response": []
    },
    {
      "name": "member attandance export",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}//member-attendance/export",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "",
            "member-attendance",
            "export"
          ]
        }
      },
      "response": []
    },
    {
      "name": "create bmr",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          },
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjFlYTc4M2ZhLTRlOGYtNDBmOC05NWE1LWUxODliMjRkMjMzNCIsImVtYWlsIjoic2hhbXMxMjNAZ21haWwuY29tIiwicm9sZV9pZCI6MSwiaWF0IjoxNzY1NDQ2ODUxLCJleHAiOjE3NjYwNTE2NTF9.HNyQPQp9PDX2_iNgzzou0uOxHR0n1vIuJxn23FQW9Oc"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n    \"member_id\": \"8c3c0f1b-7ed5-4615-b554-29dacc214acc\",\n    \"gender\": \"male\",\n    \"age\": 23,\n    \"weight\": 15,\n    \"height\": 75,\n    \"heart_rate_rest\": \"65\",\n    \"heart_rate_treadmill\": \"140\",\n    \"push_up\": \"02\",\n    \"curl_up\": \"0\",\n    \"mobility\": \"poor\",\n    \"sit_reach\": \"15\",\n    \"profession\": \"cloud Developer\",\n    \"work_time_start\": \"10:30\",\n    \"work_time_end\": \"19:30\",\n    \"meal1_time\": \"09:00\",\n    \"meal2_time\": \"14:00\",\n    \"meal3_time\": \"2:00\",\n    \"aims\": \"weight loss, muscle gain\",\n    \"chest\": 102,\n    \"hips\": 400,\n    \"stomach\": 485,\n    \"thigh\": 260,\n    \"body_age\": 28\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/bmr",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "bmr"
          ]
        }
      },
      "response": []
    },
    {
      "name": "update bmr",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "PUT",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          },
          {
            "key": "Authorization",
            "value": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjFlYTc4M2ZhLTRlOGYtNDBmOC05NWE1LWUxODliMjRkMjMzNCIsImVtYWlsIjoic2hhbXMxMjNAZ21haWwuY29tIiwicm9sZV9pZCI6MSwiaWF0IjoxNzY1NDQ2ODUxLCJleHAiOjE3NjYwNTE2NTF9.HNyQPQp9PDX2_iNgzzou0uOxHR0n1vIuJxn23FQW9Oc"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n    \"id\":\"5bb8221d-19a2-49a2-973c-e48303b2bd74\",\n    \"member_id\": \"8c3c0f1b-7ed5-4615-b554-29dacc214acc\",\n    \"gender\": \"male\",\n    \"age\": 23,\n    \"weight\": 15,\n    \"height\": 75,\n    \"heart_rate_rest\": \"65\",\n    \"heart_rate_treadmill\": \"140\",\n    \"push_up\": \"02\",\n    \"curl_up\": \"0\",\n    \"mobility\": \"poor\",\n    \"sit_reach\": \"15\",\n    \"profession\": \"cloud Developer\",\n    \"work_time_start\": \"10:30\",\n    \"work_time_end\": \"19:30\",\n    \"meal1_time\": \"09:00\",\n    \"meal2_time\": \"14:00\",\n    \"meal3_time\": \"2:00\",\n    \"aims\": \"weight loss, muscle gain\",\n    \"chest\": 102,\n    \"hips\": 400,\n    \"stomach\": 485,\n    \"thigh\": 260,\n    \"body_age\": 28\n}",
          "options": {
            "raw": {
              "language": "json"
            }
          }
        },
        "url": {
          "raw": "{{URL}}/bmr",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "bmr"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get bmr",
      "protocolProfileBehavior": {
        "disableBodyPruning": true
      },
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "body": {
          "mode": "urlencoded",
          "urlencoded": []
        },
        "url": {
          "raw": "{{URL}}/bmr?member_id=8c3c0f1b-7ed5-4615-b554-29dacc214acc",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "bmr"
          ],
          "query": [
            {
              "key": "member_id",
              "value": "8c3c0f1b-7ed5-4615-b554-29dacc214acc"
            }
          ]
        }
      },
      "response": []
    },
    {
      "name": "delete bmr",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "DELETE",
        "header": [],
        "body": {
          "mode": "urlencoded",
          "urlencoded": [
            {
              "key": "id",
              "value": "5bb8221d-19a2-49a2-973c-e48303b2bd74",
              "type": "text",
              "uuid": "ea183ca3-957a-4ecd-b09c-ad7eaff0b5e2"
            }
          ]
        },
        "url": {
          "raw": "{{URL}}/bmr",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "bmr"
          ]
        }
      },
      "response": []
    },
    {
      "name": "todays sales",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/sales/today",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "sales",
            "today"
          ]
        }
      },
      "response": []
    },
    {
      "name": "dashboard",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/dashboard/stats",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "dashboard",
            "stats"
          ]
        }
      },
      "response": []
    },
    {
      "name": "dashboard plan stats",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/dashboard/plan-stats",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "dashboard",
            "plan-stats"
          ]
        }
      },
      "response": []
    },
    {
      "name": "dashboard upcoming session",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/dashboard/upcomming-sessions",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "dashboard",
            "upcomming-sessions"
          ]
        }
      },
      "response": []
    },
    {
      "name": "dashboard recent Activities",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/dashboard/recent-activity",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "dashboard",
            "recent-activity"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get revenuetoday",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/revenue/today",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "revenue",
            "today"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get revenue weekly",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/revenue/weekly",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "revenue",
            "weekly"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get revenue monthly",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/revenue/monthly",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "revenue",
            "monthly"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get revenue total",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/revenue/total",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "revenue",
            "total"
          ]
        }
      },
      "response": []
    },
    {
      "name": "get pending revenue",
      "request": {
        "auth": {
          "type": "bearer",
          "bearer": [
            {
              "key": "token",
              "value": "{{dev_token}}",
              "type": "string"
            }
          ]
        },
        "method": "GET",
        "header": [],
        "url": {
          "raw": "{{URL}}/revenue/pending",
          "host": [
            "{{URL}}"
          ],
          "path": [
            "revenue",
            "pending"
          ]
        }
      },
      "response": []
    }
  ]
}