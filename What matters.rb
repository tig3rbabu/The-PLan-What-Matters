use_bpm 110


live_loop :cheeky do
  tick
  with_fx :gverb, room: 65, release: 4, mix: 0.4 do
    synth :piano, note: chord(ring(58,58-5,58+2,58-2).look-0, ring(:major,:major,:minor7,:major7).look, invert:ring(0,2,0,1).look), amp: 0.5, release: 6, hard: 0.3, vel: 0.5
    synth :dsaw, note: ring(58,58-5,58-2,58-2).look-24, amp: 1, sustain: 4, release: 0, detune: 0.3, cutoff: 60
    sleep 4
  end
end

live_loop :shimmy do
  tick
  with_fx :gverb, room: 65, release: 4, mix: 0.2 do
    with_fx :slicer, phase: 0.25, wave: 0, pulse_width: 0.25, mix: 1 do
      a = synth :dsaw, note: chord(58, '5'), note_slide: 0, amp: 1.2, sustain: 32, release: 0, detune: 0.3
      sleep 16
      control a, note: chord(58+5-0, '5')
      sleep 8
      control a, note: chord(58+2-0, '5')
      sleep 8
    end
  end
end