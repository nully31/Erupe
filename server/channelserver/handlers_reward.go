package channelserver

import (
	"encoding/hex"
	"time"

	"erupe-ce/common/byteframe"
	"erupe-ce/network/mhfpacket"
)

func handleMsgMhfGetAdditionalBeatReward(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfGetAdditionalBeatReward)
	// Actual response in packet captures are all just giant batches of null bytes
	// I'm assuming this is because it used to be tied to an actual event and
	// they never bothered killing off the packet when they made it static
	doAckBufSucceed(s, pkt.AckHandle, make([]byte, 0x104))
}

func handleMsgMhfGetUdRankingRewardList(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfGetUdRankingRewardList)
	// Temporary canned response
	data, _ := hex.DecodeString("0100001600000A5397DF00000000000000000000000000000000")
	doAckBufSucceed(s, pkt.AckHandle, data)
}

func handleMsgMhfGetRewardSong(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfGetRewardSong)
	bf := byteframe.NewByteFrame()
	var SongLimit time.Time
	err := s.server.db.QueryRow("SELECT song_limit FROM demo_reward_song WHERE char_id=$1", s.charID).Scan(&SongLimit)
	if err != nil {
		bf.WriteUint16(0)
		bf.WriteUint32(0)
		bf.WriteUint32(0)
	} else {
		bf.WriteUint16(0)
		bf.WriteUint32(0)
		bf.WriteUint32(uint32(SongLimit.Unix()))
	}
	doAckBufSucceed(s, pkt.AckHandle, bf.Data())
	doAckSimpleSucceed(s, pkt.AckHandle, make([]byte, 4))
}

func handleMsgMhfUseRewardSong(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfUseRewardSong)
	songLimit := time.Date(2045, 9, 16, 19, 17, 23, 0, time.UTC) //Time_Current_Adjusted().Add(-9 * time.Hour)
	s.server.db.Exec("INSERT INTO demo_reward_song(char_id) SELECT $1 WHERE NOT EXISTS(SELECT * FROM demo_reward_song WHERE char_id = $1);", s.charID)
	s.server.db.Exec("UPDATE demo_reward_song SET song_limit = $1 WHERE char_id = $2", songLimit, s.charID)
	doAckBufSucceed(s, pkt.AckHandle, make([]byte, 1))
}

func handleMsgMhfAddRewardSongCount(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfAddRewardSongCount)
	// if you want to have it deactivate every time you finish a quest, set $1 to null.
	s.server.db.Exec("UPDATE demo_reward_song SET song_limit = $1 WHERE char_id = $2", 1, s.charID)
	doAckBufSucceed(s, pkt.AckHandle, make([]byte, 1))
}

func handleMsgMhfAcquireMonthlyReward(s *Session, p mhfpacket.MHFPacket) {
	pkt := p.(*mhfpacket.MsgMhfAcquireMonthlyReward)

	resp := byteframe.NewByteFrame()
	resp.WriteUint32(0)

	doAckBufSucceed(s, pkt.AckHandle, resp.Data())
}

func handleMsgMhfAcceptReadReward(s *Session, p mhfpacket.MHFPacket) {}

func handleMsgMhfGetBreakSeibatuLevelReward(s *Session, p mhfpacket.MHFPacket) {}

func handleMsgMhfGetWeeklySeibatuRankingReward(s *Session, p mhfpacket.MHFPacket) {}
