# IsdaOK

A surface quality assessment mobile application, made with React Natice/Expo for the frontend, Express and MySQL for the backend, and Python libraries for image-processing and ML/DL layer.

The project aim to assess visible quality indicators of a fish with **classical image processing** algorithms. Implemented with a ResNet-34 model which will remove the image's back and a Random forest model that will calculate the quality level of the fish.

## Installation:

1. Install dependencies:
   - [Node.js and npm](https://nodejs.org/en/download/current)
   - [MySQL](https://dev.mysql.com/downloads/workbench/)
   - [Python 3](https://www.python.org/downloads/)
   - [Expo Go](https://play.google.com/store/apps/details?id=host.exp.exponent&hl=en)
2. Clone the repo

```
git clone https://github.com/RenzDureza/IsdaOK.git
cd IsdaOK
```

3. Install frontend dependencies

```
cd IsdaOK/frontend
npm install
```

4. Install backend dependencies

```
cd IsdaOK/backend
npm install
```

5. Setup the Python environment

```
cd IsdaOK/backend/src/python
```

Create and activate a virtual environment using the instructions for your operating system.

**Windows**

```
py -3 -m venv .venv
.\.venv\Scripts\Activate.ps1
```

**macOS/Linux**

```
python3 -m venv .venv
source .venv/bin/activate
```

With the virtual environment activated, install the Python dependencies

```
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

## Environment configuration

Create 2 `.env` files in the frontend and backend directories. These will contain the settings needed to connect the app with the APIs.

### Frontend environment variables

|      Variable       |                   Description                   |
| :-----------------: | :---------------------------------------------: |
|                     |                                                 |
| EXPO_PUBLIC_API_URL | Express backend's base URL, including the port. |

### Backend environment variables

|   Variable   |                                                                            Description                                                                            |
| :----------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|    `PORT`    |                                                  Port used by the Express server. Defaults to `3000` if omitted.                                                  |
|  `BASE_URL`  | Backend origin used to build email-verification and password-reset links. Use an address reachable from the device opening those links, without a trailing slash. |
|  `DB_HOST`   |                                                                  IP address of the MySQL server.                                                                  |
|  `DB_PORT`   |                                                                        MySQL server port.                                                                         |
|  `DB_USER`   |                                                 MySQL account with permission to access the application database.                                                 |
|  `DB_PASS`   |                                                                  Password for the MySQL account.                                                                  |
|  `DB_NAME`   |                                       Application database name (Use `isdaok` when following the supplied database setup).                                        |
| `JWT_SECRET` |                        A randomly generated secret used to sign and verify authentication, email-verification, and password-reset tokens.                         |

## Usage

Open 3 terminals for the frontend, backend and python servers.

### Activate backend servers

1. Run these commands on the 1st terminal to activate backend servers

```
cd IsdaOK/backend
npm run dev
```

2. On the 2nd terminal, activate the Python layer with there commands.

```
cd IsdaOk/backend/src/python
python -m uvicorn app:app --reload --port 8000
```

### Activate frontend

1. Start the development server on the last server.

```
cd IsdaOK/frontend
npx expo start
```

2. Upon starting, a QR code will be generated, scan it with your Expo Go application to start the build on your phone.

### Database Setup

These instructions use XAMPP’s MySQL service. You can use another MySQL-compatible service if you prefer.

1. Open the XAMPP Control Panel and start **Apache** and **MySQL**.
2. In your browser, go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
3. In phpMyAdmin, select the **SQL** tab.
4. Open `IsdaOK/backend/src/config/db-setup.sql` from your project folder and copy its contents.
5. Paste the SQL statements into the query box and click **Go** to run them.

Alternatively, select the **Import** tab in phpMyAdmin and upload `db-setup.sql`.

## Developers

<div align="center">
  <img src="frontend/assets/images/bg_m.png" alt="Company logo" width="180">

  <h3>IsdaOK Development Team</h3>

  <img src="frontend/assets/images/hollowrithmpic.png" alt="Photo of the IsdaOK development team" width="700">
</div>
