package com.callcenter.model;

public enum ProblemTypeEnum {
    // 優先定義列舉實例，傳入二個參數
    p1("1", "書籍商品相關問題"),
    p2("2", "訂單相關問題"),
    p3("3", "其他建議相關");

    // 新屬性需寫在列舉實例之後
    private String problemType;
    private String description;

    // 建構子預設為 private，可寫可不寫；不能定義為public
    // 建構子有二個參數
    ProblemTypeEnum(String problemType, String desc) {
        this.problemType = problemType;
        this.description = desc;
    }

    public String getProblemType() {
        return problemType;
    }

    public String getDescription() {
        return description;
    }
    
    public static String getDescriptionByKey(String problemType) {
    	for(ProblemTypeEnum p : ProblemTypeEnum.values()){
            if(problemType.equals(p.getProblemType())) return p.getDescription();
        }
    	return "";
    }
}