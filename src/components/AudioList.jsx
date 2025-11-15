import AudioPlayer from './AudioPlayer'
import './AudioList.css'

function AudioList({ recordings, playingId, onPlay, onPause, onDelete }) {
  return (
    <div className="audio-list">
      {recordings.map((recording) => (
        <div key={recording.id} className="audio-item">
          <div className="audio-item-header">
            <div className="audio-info">
              <span className="audio-date">📅 {recording.date}</span>
            </div>
            <button
              className="delete-button"
              onClick={() => {
                if (window.confirm('¿Estás seguro de que quieres eliminar esta grabación?')) {
                  onDelete(recording.id)
                }
              }}
            >
              🗑️
            </button>
          </div>
          <AudioPlayer
            audioData={recording.audioData}
            isPlaying={playingId === recording.id}
            onPlay={() => onPlay(recording.id)}
            onPause={onPause}
          />
        </div>
      ))}
    </div>
  )
}

export default AudioList
