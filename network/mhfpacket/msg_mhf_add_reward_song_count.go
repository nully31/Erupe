package mhfpacket

import (
	"errors"

	"erupe-ce/common/byteframe"
	"erupe-ce/network"
	"erupe-ce/network/clientctx"
)

// MsgMhfAddRewardSongCount represents the MSG_MHF_ADD_REWARD_SONG_COUNT
type MsgMhfAddRewardSongCount struct {
	AckHandle uint32
	unk0      uint32
	unk1      uint16
	Count     uint8
	CharID    uint16
}

// Opcode returns the ID associated with this packet type.
func (m *MsgMhfAddRewardSongCount) Opcode() network.PacketID {
	return network.MSG_MHF_ADD_REWARD_SONG_COUNT
}

// Parse parses the packet from binary
func (m *MsgMhfAddRewardSongCount) Parse(bf *byteframe.ByteFrame, ctx *clientctx.ClientContext) error {
	m.AckHandle = bf.ReadUint32()
	m.unk0 = bf.ReadUint32()
	m.unk1 = bf.ReadUint16()
	m.Count = bf.ReadUint8()
	m.CharID = bf.ReadUint16()
	return nil
}

// Build builds a binary packet from the current data.
func (m *MsgMhfAddRewardSongCount) Build(bf *byteframe.ByteFrame, ctx *clientctx.ClientContext) error {
	return errors.New("NOT IMPLEMENTED")
}
