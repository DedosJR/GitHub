import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Home from "./pages/home";
import Contact from "./pages/contact";
import Portafolio from "./pages/Portafolio";
import "../src/assets/css/App.css";

function App() {
  return (
    <Router>
      <header className="App-header">
        <div className="App-title">
          <h2>Mi nombre es Israel Flores</h2>
          <p>Soy Desarrollador Web</p>
          <p>Radico en Tijuana B.C México</p>
          <button className="App-button">Contactame</button>
          <button className="App-button">Contactame</button>
          <button className="App-button">Contactame</button>
        </div>
        <div className="App-setup">
          <img
            src="/img/Israel Flores.png"
            className="App-image-israel "
            alt="img"
          />
        </div>
      </header>
      <div className="App">
        <nav className="App-nav">
          <ul>
            <li>
              <Link to="/">Inicio</Link>
            </li>
            <li>
              <Link to="/contact">Contacto</Link>
            </li>
            <li>
              <Link to="/portafolio">Portafolio</Link>
            </li>
          </ul>
        </nav>

        <section className="App-content">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/contact" element={<Contact />} />
            <Route path="/portafolio" element={<Portafolio />} />
          </Routes>
        </section>

        <footer className="App-footer">
          <p>Copyright 2025</p>
        </footer>
      </div>
    </Router>
  );
}

export default App;
