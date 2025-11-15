import { useState, useRef, useEffect } from 'react'
import './AudioRecorder.css'

function AudioRecorder({ onRecordingComplete }) {
  const [isRecording, setIsRecording] = useState(false)
  const [isPaused, setIsPaused] = useState(false)
  const [recordingTime, setRecordingTime] = useState(0)
  const [hasPermission, setHasPermission] = useState(null)

  const mediaRecorderRef = useRef(null)
  const chunksRef = useRef([])
  const timerRef = useRef(null)
  const streamRef = useRef(null)

  useEffect(() => {
    return () => {
      if (timerRef.current) {
        clearInterval(timerRef.current)
      }
      if (streamRef.current) {
        streamRef.current.getTracks().forEach(track => track.stop())
      }
    }
  }, [])

  const startTimer = () => {
    timerRef.current = setInterval(() => {
      setRecordingTime(prev => prev + 1)
    }, 1000)
  }

  const stopTimer = () => {
    if (timerRef.current) {
      clearInterval(timerRef.current)
      timerRef.current = null
    }
  }

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
  }

  const startRecording = async () => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({
        audio: {
          echoCancellation: true,
          noiseSuppression: true,
          sampleRate: 44100
        }
      })

      streamRef.current = stream
      setHasPermission(true)

      // Usar diferentes formatos según el navegador
      const mimeType = MediaRecorder.isTypeSupported('audio/webm')
        ? 'audio/webm'
        : 'audio/mp4'

      const mediaRecorder = new MediaRecorder(stream, { mimeType })
      mediaRecorderRef.current = mediaRecorder
      chunksRef.current = []

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          chunksRef.current.push(event.data)
        }
      }

      mediaRecorder.onstop = () => {
        const audioBlob = new Blob(chunksRef.current, { type: mimeType })
        onRecordingComplete(audioBlob)
        chunksRef.current = []

        // Detener todas las pistas de audio
        stream.getTracks().forEach(track => track.stop())
      }

      mediaRecorder.start()
      setIsRecording(true)
      setRecordingTime(0)
      startTimer()
    } catch (error) {
      console.error('Error al acceder al micrófono:', error)
      setHasPermission(false)
      alert('No se pudo acceder al micrófono. Por favor, permite el acceso al micrófono en la configuración de tu navegador.')
    }
  }

  const pauseRecording = () => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state === 'recording') {
      mediaRecorderRef.current.pause()
      setIsPaused(true)
      stopTimer()
    }
  }

  const resumeRecording = () => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state === 'paused') {
      mediaRecorderRef.current.resume()
      setIsPaused(false)
      startTimer()
    }
  }

  const stopRecording = () => {
    if (mediaRecorderRef.current && mediaRecorderRef.current.state !== 'inactive') {
      mediaRecorderRef.current.stop()
      setIsRecording(false)
      setIsPaused(false)
      stopTimer()
      setRecordingTime(0)
    }
  }

  return (
    <div className="audio-recorder">
      {!isRecording ? (
        <div className="recorder-idle">
          <button className="record-button" onClick={startRecording}>
            <div className="record-icon"></div>
          </button>
          <p className="record-label">Presiona para grabar</p>
        </div>
      ) : (
        <div className="recorder-active">
          <div className="recording-indicator">
            <span className="pulse"></span>
            <span className="recording-text">Grabando</span>
          </div>

          <div className="recording-time">
            {formatTime(recordingTime)}
          </div>

          <div className="recording-controls">
            {!isPaused ? (
              <button className="control-button pause" onClick={pauseRecording}>
                ⏸
              </button>
            ) : (
              <button className="control-button resume" onClick={resumeRecording}>
                ▶️
              </button>
            )}
            <button className="control-button stop" onClick={stopRecording}>
              ⏹
            </button>
          </div>
        </div>
      )}

      {hasPermission === false && (
        <div className="permission-error">
          ⚠️ Se requiere permiso para usar el micrófono
        </div>
      )}
    </div>
  )
}

export default AudioRecorder
