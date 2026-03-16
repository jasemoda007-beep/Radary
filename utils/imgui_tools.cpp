//
//  ImguiTools.cpp
//  Dolphins
//
//  Created by xbk on 2022/4/25.
//


#include "imgui_tools.h"

void HelpMarker(const char *desc) {
    ImGui::TextColored(ImVec4(1.0f, 0.0f, 0.0f, 1.0f), "(?)");
    if (ImGui::IsItemHovered()) {
        ImGui::BeginTooltip();
        ImGui::PushTextWrapPos(ImGui::GetFontSize() * 45.0f);
        ImGui::TextUnformatted(desc);
        ImGui::PopTextWrapPos();
        ImGui::EndTooltip();
    }
}

float calcTextSize(const char *text, float font_size) {
    ImGuiContext &g = *GImGui;
    
    ImFont *font = g.Font;
    
    ImVec2 text_size;
    if (font_size == 0) {
        text_size = font->CalcTextSizeA(font->FontSize, FLT_MAX, -1.0f, text, NULL, NULL);
    } else {
        text_size = font->CalcTextSizeA(font_size, FLT_MAX, -1.0f, text, NULL, NULL);
    }
    
    text_size.x = IM_FLOOR(text_size.x + 0.99999f);
    
    return text_size.x;
}

void setDarkTheme() {
    
     ImGuiStyle *style = &ImGui::GetStyle();
      style->WindowRounding = 10.0f;
   style->WindowTitleAlign = ImVec2(0.5, 0.5);
     style->FrameRounding = 10.0f;
     style->FramePadding = ImVec2(4, 7);
     style->ScrollbarSize = 40;
     style->GrabMinSize = 23;
    
    ImVec4* colors = style->Colors;

    style->Colors[ImGuiCol_Text]                   = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);
style->Colors[ImGuiCol_TextDisabled]           = ImVec4(0.00f, 0.0f, 0.00f, 0.00f);
style->Colors[ImGuiCol_WindowBg]               = ImVec4(255 / 255.f, 255 / 255.f, 255 / 255.f, 230 / 255.f);
style->Colors[ImGuiCol_ChildBg]                = ImVec4(255 / 255.f, 0 / 255.f, 0 / 255.f, 0 / 255.f);
style->Colors[ImGuiCol_PopupBg]                = ImVec4(255 / 255.f, 0 / 255.f, 0 / 255.f, 0 / 255.f);
style->Colors[ImGuiCol_Border]                 = ImVec4(255 / 255.f, 255 / 255.f, 255 / 255.f,  77/ 255.f);
style->Colors[ImGuiCol_BorderShadow]           = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
style->Colors[ImGuiCol_FrameBg]                = ImVec4(255 / 255.f, 255 / 255.f, 255 / 255.f, 250 / 255.f);
style->Colors[ImGuiCol_FrameBgHovered]         = ImVec4(255 / 255.f, 255 / 255.f, 255 / 255.f, 250 / 255.f);
style->Colors[ImGuiCol_FrameBgActive]          = ImVec4(186 / 255.f, 229 / 255.f, 255 / 255.f, 132 / 255.f);
style->Colors[ImGuiCol_TitleBg]                = ImVec4(1.0f, 1.0f, 1.0f, 0.87f);
style->Colors[ImGuiCol_TitleBgActive]          = ImVec4(1.0f, 1.0f, 1.0f, 0.87f);
style->Colors[ImGuiCol_TitleBgCollapsed]       = ImVec4(1.0f, 1.0f, 1.0f, 0.87f);
style->Colors[ImGuiCol_MenuBarBg]              = ImVec4(0.14f, 0.14f, 0.14f, 0.00f);

style->Colors[ImGuiCol_ScrollbarBg]            = ImVec4(250 / 255.f, 250 / 255.f, 250 / 255.f, 130 / 255.f);
style->Colors[ImGuiCol_ScrollbarGrab]          = ImVec4(124 / 255.f, 124 / 255.f, 124 / 255.f, 45 / 255.f);
style->Colors[ImGuiCol_ScrollbarGrabHovered]   = ImVec4(124 / 255.f, 124 / 255.f, 124 / 255.f, 45 / 255.f);
style->Colors[ImGuiCol_ScrollbarGrabActive]    = ImVec4(124 / 255.f, 124 / 255.f, 124 / 255.f, 45 / 255.f);
style->Colors[ImGuiCol_CheckMark]              = ImVec4(59 / 255.f, 147 / 255.f, 252 / 255.f, 255 / 255.f);
style->Colors[ImGuiCol_SliderGrab]             = ImVec4(66 / 255.f, 150 / 255.f, 250 / 255.f, 199 / 255.f);
style->Colors[ImGuiCol_SliderGrabActive]       = ImVec4(66 / 255.f, 150 / 255.f, 250 / 255.f, 199 / 255.f);
colors[ImGuiCol_Button]            = ImColor(58, 160, 110, 255).Value;
colors[ImGuiCol_ButtonHovered]          = ImColor(58, 160, 110, 255).Value;
colors[ImGuiCol_ButtonActive]            = ImColor(70, 195, 132, 255).Value;
style->Colors[ImGuiCol_Header]                 = ImVec4(0.26f, 0.59f, 0.98f, 0.0f);
style->Colors[ImGuiCol_HeaderHovered]          = ImVec4(0.26f, 0.59f, 0.98f, 0.0f);
style->Colors[ImGuiCol_HeaderActive]           = ImVec4(0 / 255.f, 150 / 255.f, 255/ 255.f, 94 / 255.f);
style->Colors[ImGuiCol_Separator]              = ImVec4(0.43f, 0.43f, 0.50f, 0.5f);
style->Colors[ImGuiCol_SeparatorHovered]       = ImVec4(0.10f, 0.40f, 0.75f, 0.78f);
style->Colors[ImGuiCol_SeparatorActive]        = ImVec4(0.10f, 0.40f, 0.75f, 1.00f);
style->Colors[ImGuiCol_ResizeGrip]             = ImVec4(0.26f, 0.59f, 0.98f, 0.20f);
style->Colors[ImGuiCol_ResizeGripHovered]      = ImVec4(0.26f, 0.59f, 0.98f, 0.67f);
style->Colors[ImGuiCol_ResizeGripActive]       = ImVec4(0.26f, 0.59f, 0.98f, 0.95f);
//   style->Colors[ImGuiCol_Tab]                    = ImLerp(style->Colors[ImGuiCol_Header],       style->Colors[ImGuiCol_TitleBgActive], 0.80f);
style->Colors[ImGuiCol_TabHovered]             = style->Colors[ImGuiCol_HeaderHovered];
//    style->Colors[ImGuiCol_TabActive]              = ImLerp(style->Colors[ImGuiCol_HeaderActive], style->Colors[ImGuiCol_TitleBgActive], 0.60f);
//  style->Colors[ImGuiCol_TabUnfocused]           = ImLerp(style->Colors[ImGuiCol_Tab],          style->Colors[ImGuiCol_TitleBg], 0.80f);
//  style->Colors[ImGuiCol_TabUnfocusedActive]     = ImLerp(style->Colors[ImGuiCol_TabActive],    style->Colors[ImGuiCol_TitleBg], 0.40f);
style->Colors[ImGuiCol_PlotLines]              = ImVec4(0.61f, 0.61f, 0.61f, 1.00f);
style->Colors[ImGuiCol_PlotLinesHovered]       = ImVec4(1.00f, 0.43f, 0.35f, 1.00f);
style->Colors[ImGuiCol_PlotHistogram]          = ImVec4(0.90f, 0.70f, 0.00f, 1.00f);
style->Colors[ImGuiCol_PlotHistogramHovered]   = ImVec4(1.00f, 0.60f, 0.00f, 1.00f);
style->Colors[ImGuiCol_TableHeaderBg]          = ImVec4(0.19f, 0.19f, 0.20f, 1.00f);
style->Colors[ImGuiCol_TableBorderStrong]      = ImVec4(0.31f, 0.31f, 0.35f, 1.00f);   // Prefer using Alpha=1.0 here
style->Colors[ImGuiCol_TableBorderLight]       = ImVec4(0.23f, 0.23f, 0.25f, 1.00f);   // Prefer using Alpha=1.0 here
style->Colors[ImGuiCol_TableRowBg]             = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
style->Colors[ImGuiCol_TableRowBgAlt]          = ImVec4(1.00f, 1.00f, 1.00f, 0.06f);
style->Colors[ImGuiCol_TextSelectedBg]         = ImVec4(0.26f, 0.59f, 0.98f, 0.35f);
style->Colors[ImGuiCol_DragDropTarget]         = ImVec4(1.00f, 1.00f, 0.00f, 0.90f);
style->Colors[ImGuiCol_NavHighlight]           = ImVec4(0.26f, 0.59f, 0.98f, 1.00f);
style->Colors[ImGuiCol_NavWindowingHighlight]  = ImVec4(1.00f, 1.00f, 1.00f, 0.70f);
style->Colors[ImGuiCol_NavWindowingDimBg]      = ImVec4(0.80f, 0.80f, 0.80f, 0.20f);
style->Colors[ImGuiCol_ModalWindowDimBg]       = ImVec4(0.80f, 0.80f, 0.80f, 0.35f);

}