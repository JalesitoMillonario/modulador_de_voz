import { useState, useEffect, useRef } from 'react'
import './App.css'
import AudioRecorder from './components/AudioRecorder'
import AudioList from './components/AudioList'

function App() {
  const [recordings, setRecordings] = useState([])
  const [playingId, setPlayingId] = useState(null)

  // Cargar grabaciones desde localStorage al iniciar
  useEffect(() => {
    const savedRecordings = localStorage.getItem('audioRecordings')
    if (savedRecordings) {
      try {
        const parsed = JSON.parse(savedRecordings)
        setRecordings(parsed)
      } catch (error) {
        console.error('Error al cargar grabaciones:', error)
      }
    }
  }, [])

  // Guardar grabaciones en localStorage cuando cambien
  useEffect(() => {
    if (recordings.length > 0) {
      localStorage.setItem('audioRecordings', JSON.stringify(recordings))
    }
  }, [recordings])

  const handleNewRecording = (audioBlob) => {
    const reader = new FileReader()
    reader.readAsDataURL(audioBlob)
    reader.onloadend = () => {
      const base64Audio = reader.result
      const newRecording = {
        id: Date.now(),
        date: new Date().toLocaleString('es-ES'),
        audioData: base64Audio,
        duration: 0
      }
      setRecordings(prev => [newRecording, ...prev])
    }
  }

  const handleDelete = (id) => {
    setRecordings(prev => prev.filter(rec => rec.id !== id))
    if (recordings.length === 1) {
      localStorage.removeItem('audioRecordings')
    }
  }

  const handlePlay = (id) => {
    setPlayingId(id)
  }

  const handlePause = () => {
    setPlayingId(null)
  }

  return (
    <div className="app">
      <header className="app-header">
        <h1>🎙️ Grabadora de Audio</h1>
        <p>Graba, guarda y reproduce tus audios</p>
      </header>

      <AudioRecorder onRecordingComplete={handleNewRecording} />

      <div className="recordings-section">
        <h2>
          Mis Grabaciones
          {recordings.length > 0 && <span className="count">({recordings.length})</span>}
        </h2>
        {recordings.length === 0 ? (
          <div className="empty-state">
            <p>📭 No hay grabaciones aún</p>
            <p className="hint">Presiona el botón de arriba para grabar</p>
          </div>
        ) : (
          <AudioList
            recordings={recordings}
            playingId={playingId}
            onPlay={handlePlay}
            onPause={handlePause}
            onDelete={handleDelete}
          />
        )}
      </div>
    </div>
  )
}

export default App
