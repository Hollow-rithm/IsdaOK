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

## Environment configuration

Create 2 `.env` files in the frontend and backend directories. These will contain the settings needed to connect the app with the APIs.

```
IsdaOK/
```

---

## EYES

    eye_clarity
    edge_density
    eyes_redness

OVERALL_EYES

## GILLS

    gills_hue
    gills_saturation
    gills_value

OVERALL_GILLS

## BODY

    shine_coverage
    shine_average
    body_hue
    body_saturation
    body_value
    ? body damage

OVERALL_BODY

## TAIL

    ? tail damage

OVERALL_TAIL

## ML

OVERALL_SCORE
